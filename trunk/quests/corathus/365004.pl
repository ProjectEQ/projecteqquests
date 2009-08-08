#council king
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 2, 0);
		quest::stoptimer("rage");
		quest::stoptimer("kill");
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 1, 0);
		$npc->SetEntityVariable(1, 0);
		$npc->SetEntityVariable(2, 1);
		my $incoming_message = int(rand(3));
		if($incoming_message == 2)
		{
			quest::shout("I am the king!");
		}
		elsif($incoming_message == 1)
		{
			quest::shout("You shall not take my crown!");
		}
		else
		{
			quest::shout("Bow down to Meldrath, urchins!");
		}
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 3, 0);
	quest::shout("The throne... usurped...");
	quest::stoptimer("rage");
	quest::stoptimer("kill");
}

sub EVENT_SIGNAL
{
	if($signal == 1 || $signal == 2 || $signal == 3 || $signal == 4)
	{
		my $num_dead = ($npc->GetEntityVariable(1) + 1);
		$npc->SetEntityVariable(1, $num_dead);
		quest::emote("roars with rage as his comrade falls.");
		
		if(int(rand(2)) == 1)
		{
			quest::shout("I shall see that you pay for this outrage!");
		}
		else
		{
			quest::shout("filthy mortals!");
		}
		
		quest::stoptimer("rage");
		quest::settimer("rage", 15);
		quest::modifynpcstat("attack_speed", "-50");
	}
	
	if($signal == 5)
	{
		my $random_val = int(rand(10));
		if($random_val == 0)
		{
			quest::shout("I wager I kill the first one, anyone care to take it?");
		}
		elsif($random_val == 1)
		{
			quest::shout("Mortals, give into Meldrath.");
		}
		elsif($random_val == 2)
		{
			quest::shout("Let your anger consume you.");
		}
		elsif($random_val == 3)
		{
			quest::shout("Death, destruction, all that awaits you mortals.");
		}
		elsif($random_val == 4)
		{
			quest::shout("They prance about like ants on a honey pot, amusing isn't it?");
		}
		elsif($random_val == 5)
		{
			quest::shout("I hate wood elves almost as much as I hate halflings... almost.");
		}
		elsif($random_val == 6)
		{
			quest::shout("I shall grind your bones to dust.");
		}
		elsif($random_val == 7)
		{
			quest::shout("Mortals, I have need of something to test my blade on. Please remove your armor and expose your torso to my blade and we can make this quick.");
		}
		elsif($random_val == 8)
		{
			quest::shout("Bash their skulls in!");
		}
		elsif($random_val == 9)
		{
			quest::shout("The agony of mortality... I love it.");
		}
	}
}

sub EVENT_TIMER
{
	if($timer eq "rage")
	{
		quest::stoptimer("rage");
		quest::modifynpcstat("attack_speed", "0");
	}
	
	if($timer eq "kill")
	{
		$npc->SetEntityVariable(2, 1);
		quest::stoptimer("kill");
	}
}

sub EVENT_SLAY
{
	my $can_shout = $npc->GetEntityVariable(2);
	if($can_shout == 1)
	{
		quest::settimer("kill", 3);
		$npc->SetEntityVariable(2, 0);
		quest::shout("That is why I am king!");
	}
}