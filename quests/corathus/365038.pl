#Sporilok the Fungus Commander

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		stoptimer("rage");
		stoptimer("mushroom");
		stoptimer("rage_two");
		quest::ModifyNPCStat("min_hit", "1690");
		quest::ModifyNPCStat("max_hit", "3300");
		quest::ModifyNPCStat("attack_speed", "33");
		quest::signal(365073);
		quest::signal(365074);
		quest::signal(365075);
		quest::signal(365076);
		quest::signal(365077);
	}
	elsif($combat_state == 1)
	{
		quest::settimer("rage", 60);
		quest::settimer("mushroom", 5);
		quest::ModifyNPCStat("min_hit", "1690");
		quest::ModifyNPCStat("max_hit", "3300");
		quest::ModifyNPCStat("attack_speed", "33");
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
		stoptimer("rage");
		quest::settimer("rage_two", 60);
		quest::emote("begins to fall apart...");
		quest::ModifyNPCStat("min_hit", "1690");
		quest::ModifyNPCStat("max_hit", "3900");
		quest::ModifyNPCStat("attack_speed", "25");		
	}

	if($timer eq "rage_two")
	{
		stoptimer("rage_two");
		quest::emote("is filled with a bloodlust.");
		quest::ModifyNPCStat("min_hit", "9200");
		quest::ModifyNPCStat("max_hit", "15000");
		quest::ModifyNPCStat("attack_speed", "-50");		
	}
}

sub EVENT_DEATH
{
	quest::emote("slowly stops moving and comes crashing to the ground.");
	stoptimer("rage");
	stoptimer("rage_two");
	stoptimer("mushroom");
}