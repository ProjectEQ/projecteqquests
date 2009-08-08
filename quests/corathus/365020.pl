#duke

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 5, 0);	
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 4, 0);
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 6, 0);
	quest::signalwith(365004, 4, 0);
}

sub EVENT_SIGNAL
{
	if($signal == 5)
	{
		my $random_val = int(rand(10));
		if($random_val == 0)
		{
			quest::shout("Do I really have to kill the... common folk?");
		}
		elsif($random_val == 1)
		{
			quest::shout("This is mighty unpleasent business.");
		}
		elsif($random_val == 2)
		{
			quest::shout("Dignity, honor, we must fight with all these traits.");
		}
		elsif($random_val == 3)
		{
			quest::shout("Strike quickly and forcefully, take them by surprise.");
		}
		elsif($random_val == 4)
		{
			quest::shout("Let them arm themselves for battle.");
		}
		elsif($random_val == 5)
		{
			quest::shout("There is no honor in killing mortals, they're basically defenseless, still if they want battle... I will oblige them.");
		}
		elsif($random_val == 6)
		{
			quest::shout("A smart Duke will never let his guard down, that includes me fools.");
		}
		elsif($random_val == 7)
		{
			quest::shout("These rabble don't stand a chance.");
		}
		elsif($random_val == 8)
		{
			quest::shout("Commoners are good for one thing, working my mushroom farms.");
		}
		elsif($random_val == 9)
		{
			quest::shout("Perhaps they will come to their senses and flee rather than face us.");
		}		
	}
}