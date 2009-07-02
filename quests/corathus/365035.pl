my $targeted_enemy = 0;
my $targeted_enemy_x = 0;
my $targeted_enemy_y = 0;
my $targeted_enemy_z = 0;

sub EVENT_SPAWN
{
	$targeted_enemy = 0;
	$targeted_enemy_x = 0;
	$targeted_enemy_y = 0;
	$targeted_enemy_z = 0;
}

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("missle_select");
		quest::stoptimer("missle_attack");
		quest::say("combat exit.");
	}
	elsif($combat_state == 1)
	{
		quest::starttimer("missle_select", 15);
		quest::say("combat entered.");
	}
}

sub EVENT_TIMER
{
	if($timer eq "missle_select")
	{
		quest::say("selecting missle");
		$targeted_enemy = $npc->GetHateRandom();
		if($targeted_enemy)
		{
			quest::stoptimer("missle_select");
			quest::starttimer("missle_attack", 5);
			my $clean_name = $targeted_enemy->GetCleanName();
			quest::emote("attempts to lock onto $clean_name with its anti-personnel missles.");
			$targeted_enemy_x = $targeted_enemy->GetX();
			$targeted_enemy_y = $targeted_enemy->GetY();
			$targeted_enemy_z = $targeted_enemy->GetZ();
		}
		else
		{
			quest::stoptimer("missle_select");
			quest::starttimer("missle_select", 1);
		}
	}
	
	if($timer eq "missle_attack")
	{
		quest::say("sending missle");
		if($targeted_enemy)
		{
			my $dist_x = $targeted_enemy->GetX() - $targeted_enemy_x;
			my $dist_y = $targeted_enemy->GetY() - $targeted_enemy_y;
			my $dist_z = $targeted_enemy->GetZ() - $targeted_enemy_z;
			my $total_dist = ($dist_x * $dist_x) + ($dist_y * $dist_y) + ($dist_z * $dist_z);
			if($total_dist < 1200)
			{
				$targeted_enemy->Message(0, "You were hit by the missle.");
				$targeted_enemy->Damage($npc, 15000, 0, 0, false); 
			}
			else
			{
				$targeted_enemy->Message(0, "You have evaded the missle.");
			}
		}
		quest::stoptimer("missle_attack");
		quest::starttimer("missle_select", 15);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("missle_select");
	quest::stoptimer("missle_attack");
}