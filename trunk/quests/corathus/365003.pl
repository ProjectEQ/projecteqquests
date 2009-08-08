#general two: robot

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 11, 0);	
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 10, 0);
		quest::stoptimer("flavor_text");
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 12, 0);
	quest::signalwith(365004, 3, 0);
}

sub EVENT_SIGNAL
{
	if($signal == 5)
	{
		my $random_val = int(rand(10));
		if($random_val == 0)
		{
			quest::shout("Behold the wonderous rapidity of Ginorn!");
		}
		elsif($random_val == 1)
		{
			quest::shout("Local scan complete, hostile targets identified.");
		}
		elsif($random_val == 2)
		{
			quest::shout("Probility of death for hostile targets measured at 89.2 percent chance.");
		}
		elsif($random_val == 3)
		{
			quest::shout("Preparing to execute main directive.");
		}
		elsif($random_val == 4)
		{
			quest::shout("Cavedude marked for extermination.");
		}
		elsif($random_val == 5)
		{
			quest::shout("Mortals come and help me test my next invention, it will stand up better than Merineth, I promise.");
		}
		elsif($random_val == 6)
		{
			quest::shout("I'm not just a bucket of bolts.");
		}
		elsif($random_val == 7)
		{
			quest::shout("I will oil my gears with your blood.");
		}
		elsif($random_val == 8)
		{
			quest::shout("My behemoth was my master of invention; you will pay for destroying him!");
		}
		elsif($random_val == 9)
		{
			quest::shout("They should of named me iGnome.");
		}		
	}
}