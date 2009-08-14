my $targeted_enemy;
my $targeted_enemy_x;
my $targeted_enemy_y;
my $targeted_enemy_z;

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("missle_select");
		quest::stoptimer("missle_attack");
		quest::stoptimer("overload");
		quest::stoptimer("overload_finish");
	}
	elsif($combat_state == 1)
	{
		quest::settimer("missle_select", 7);
		quest::settimer("overload", 60);
	}
}

sub EVENT_TIMER
{
	if($timer eq "missle_select")
	{
		$targeted_enemy = $npc->GetHateRandom();
		if($targeted_enemy)
		{
			quest::stoptimer("missle_select");
			quest::settimer("missle_attack", 5);
			my $clean_name = $targeted_enemy->GetCleanName();
			quest::emote("attempts to lock onto $clean_name with its anti-personnel missles.");
			$targeted_enemy_x = $targeted_enemy->GetX();
			$targeted_enemy_y = $targeted_enemy->GetY();
			$targeted_enemy_z = $targeted_enemy->GetZ();
		}
		else
		{
			quest::stoptimer("missle_select");
			quest::settimer("missle_select", 1);
		}
	}
	
	if($timer eq "missle_attack")
	{
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
				quest::say("Direct hit!");
			}
			else
			{
				$targeted_enemy->Message(0, "You have evaded the missle.");
				quest::emote("begins to recalibrate its defense system.");
			}
		}
		quest::stoptimer("missle_attack");
		quest::settimer("missle_select", 7);
	}

	if($timer eq "overload")
	{
		quest::emote("gathers energy...");
		quest::stoptimer("overload");
		quest::settimer("overload_finish", 5);
		$npc->Stun(6000);
	}

	if($timer eq "overload_finish")
	{
		quest::emote("releases its stored energy.");
		quest::stoptimer("overload_finish");
		quest::settimer("overload", 60);
		$npc->CastSpell(1948, $npc->GetID(), 10, 0);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("missle_select");
	quest::stoptimer("missle_attack");
	quest::stoptimer("overload");
	quest::stoptimer("overload_finish");
}