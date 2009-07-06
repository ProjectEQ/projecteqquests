#rusted behemoth
my $num_cogs_dead;
my $speed_up_count;

sub EVENT_SPAWN
{
	$num_cogs_dead = 0;
	$speed_up_count = 0;
}

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		$npc->SetHP(10000000);
		quest::emote("begins to power down.");
		quest::stoptimer("speed_up");
		quest::stoptimer("distance_check");
		$num_cogs_dead = 0;
		$speed_up_count = 0;
		quest::modifynpcstat("runspeed", "0.05");
		quest::depopall(365014);
	}
	elsif($combat_state == 1)
	{
		quest::emote("begins to power up but is slowed by rust.");
		quest::settimer("speed_up", 60);
		quest::settimer("distance_check", 5);
		$num_cogs_dead = 0;
		$speed_up_count = 0;
		quest::modifynpcstat("runspeed", "0.05");
		quest::spawn2(365014, 0, 0, 628, -402, -8, 181);
		quest::spawn2(365014, 0, 0, 609, -377, -8, 146);
		quest::spawn2(365014, 0, 0, 583, -376, -8, 115);
		quest::spawn2(365014, 0, 0, 558, -395, -8, 79);
		quest::spawn2(365014, 0, 0, 557, -420, -8, 54);
	}
}

sub EVENT_TIMER
{
	if($timer eq "speed_up")
	{
		quest::emote("Speeds up as some rust falls away from its frame.");
		$speed_up_count = $speed_up_count + 1;
		quest::modifynpcstat("runspeed", (0.05 + (0.1 * $speed_up_count)));
	}

	if($timer eq "distance_check")
	{
		my $dist_x = 595 - $npc->GetX();
		my $dist_y = -410 - $npc->GetY();
		my $dist_z = -8 - $npc->GetZ();
		my $total_dist = ($dist_x * $dist_x) + ($dist_y * $dist_y) + ($dist_z * $dist_z);
		if($total_dist > 122500)
		{
			quest::emote("loses its power link and switches on it's power reserves.");
			quest::modifynpcstat("runspeed", "3.0");
			quest::stoptimer("distance_check");
			quest::stoptimer("speed_up");
		}
	}
}

sub EVENT_DEATH
{
	quest::say("Fatal error: system shut down");
	quest::emote("shuts down.");
	quest::stoptimer("speed_up");
	quest::stoptimer("distance_check");
	quest::depopall(365014);
}

sub EVENT_SIGNAL
{
	$num_cogs_dead = ($num_cogs_dead + 1);
	if($npc->GetHP() > 1900000)
	{
		$npc->SetHP($npc->GetHP() - 1900000);
	}
	else
	{
		$npc->SetHP(25000);
	}
}

sub EVENT_CAST_ON
{
	if($npc->IsEngaged())
	{
		if($client)
		{
			$npc->AddToHateList($client, $client->GetLevel()*25);
		}
	}
}