#council fairy
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 14, 0);
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 13, 0);
	}
}

sub EVENT_DEATH
{
	quest::signalwith(365057, 15, 0);
	quest::signalwith(365004, 1, 0);
}

sub EVENT_SIGNAL
{
	if($signal == 5)
	{
		my $random_val = int(rand(10));
		if($random_val == 0)
		{
			quest::shout("I do hope they come and play.");
		}
		elsif($random_val == 1)
		{
			quest::shout("Mortals, come over here... I need to... introduce... myself.");
		}
		elsif($random_val == 2)
		{
			quest::shout("Sometimes I like to lure small children from their homes with my pipe... Velog usually eats them before we can have any... fun...");
		}
		elsif($random_val == 3)
		{
			quest::shout("Can I play with them Velog? Pretty please?");
		}
		elsif($random_val == 4)
		{
			quest::shout("I enjoy men with weak minds.");
		}
		elsif($random_val == 5)
		{
			quest::shout("Fly softly and carry a big stick.");
		}
		elsif($random_val == 6)
		{
			quest::shout("I would just LOVE for you all to come play.");
		}
		elsif($random_val == 7)
		{
			quest::shout("Meldrath promised me things to play with, I hope he meant these mortals.");
		}
		elsif($random_val == 8)
		{
			quest::shout("New toys, for me?");
		}
		elsif($random_val == 9)
		{
			quest::shout("Lets kill them and dance in their blood!");
		}		
	}
}