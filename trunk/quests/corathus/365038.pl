sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("rage");
		quest::stoptimer("mushroom");
		quest::stoptimer("rage_two");
		quest::modifynpcstat("min_hit", "1690");
		quest::modifynpcstat("max_hit", "3300");
		quest::modifynpcstat("attack_speed", "33");
		quest::depopall(365073);
		quest::depopall(365074);
		quest::depopall(365075);
		quest::depopall(365076);
		quest::depopall(365077);
	}
	elsif($combat_state == 1)
	{
		quest::settimer("rage", 840);
		quest::settimer("mushroom", 5);
		quest::modifynpcstat("min_hit", "1690");
		quest::modifynpcstat("max_hit", "3300");
		quest::modifynpcstat("attack_speed", "33");
	}
}

sub EVENT_TIMER
{
	if($timer eq "mushroom")
	{
		my $random_target = $npc->GetHateRandom();
		if($random_target)
		{
			my $c_name = $random_target->GetCleanName();
			my $random_mushroom = quest::ChooseRandom(365073,365074,365075,365076,365077);
			my $x_loc = $random_target->GetX();
			my $y_loc = $random_target->GetY();
			my $z_loc = $random_target->GetZ();
			quest::emote("Throws a mushroom at $c_name");
			quest::spawn($random_mushroom, 0, 0, $x_loc, $y_loc, $z_loc);
		}
	}
	
	if($timer eq "rage")
	{
		quest::stoptimer("rage");
		quest::settimer("rage_two", 60);
		quest::emote("begins to fall apart...");
		quest::modifynpcstat("min_hit", "1690");
		quest::modifynpcstat("max_hit", "3900");
		quest::modifynpcstat("attack_speed", "25");		
	}

	if($timer eq "rage_two")
	{
		quest::stoptimer("rage_two");
		quest::emote("is filled with a bloodlust.");
		quest::modifynpcstat("min_hit", "15000");
		quest::modifynpcstat("max_hit", "30000");
		quest::modifynpcstat("attack_speed", "-50");		
	}
}

sub EVENT_DEATH
{
	quest::emote("slowly stops moving and comes crashing to the ground.");
	quest::stoptimer("rage");
	quest::stoptimer("rage_two");
	quest::stoptimer("mushroom");
	quest::depopall(365073);
	quest::depopall(365074);
	quest::depopall(365075);
	quest::depopall(365076);
	quest::depopall(365077);
}