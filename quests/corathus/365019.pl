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
		if($speed_up_count == 1)
		{
			quest::modifynpcstat("runspeed", "0.10");
		}
		elsif($speed_up_count == 2)
		{
			quest::modifynpcstat("runspeed", "0.15");
		}
		elsif($speed_up_count == 3)
		{
			quest::modifynpcstat("runspeed", "0.20");
		}
		elsif($speed_up_count == 4)
		{
			quest::modifynpcstat("runspeed", "0.25");
		}
		elsif($speed_up_count == 5)
		{
			quest::modifynpcstat("runspeed", "0.30");
		}
		elsif($speed_up_count == 6)
		{
			quest::modifynpcstat("runspeed", "0.35");
		}
		elsif($speed_up_count == 7)
		{
			quest::modifynpcstat("runspeed", "0.40");
		}
		elsif($speed_up_count == 8)
		{
			quest::modifynpcstat("runspeed", "0.45");
		}
		elsif($speed_up_count == 9)
		{
			quest::modifynpcstat("runspeed", "0.55");
		}
		elsif($speed_up_count == 10)
		{
			quest::modifynpcstat("runspeed", "0.60");
		}
		else
		{
			quest::emote("reaches full speed as the last of the rust falls away.");
			quest::modifynpcstat("runspeed", "1.85");
		}
	}

	if($timer eq "distance_check")
	{
		my $dist_x = 595 - $npc->GetX();
		my $dist_y = -410 - $npc->GetY();
		my $dist_z = -8 - $npc->GetZ();
		my $total_dist = ($dist_x * $dist_x) + ($dist_y * $dist_y) + ($dist_z * $dist_z);
		if($total_dist > 250000)
		{
			quest::emote("loses its power link and begins to behave erratically.");
			quest::modifynpcstat("runspeed", "2.0");
			quest::stoptimer("distance_check");
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
	if($npc->GetHP() > 2200000)
	{
		$npc->SetHP($npc->GetHP() - 2200000);
	}
	else
	{
		$npc->Kill();
	}
}