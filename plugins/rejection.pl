#!/usr/bin/perl

sub reject_say 
	{
	my $random = int(rand(4));

	if ($random == 0) 
		{
		quest::say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
		}
	elsif ($random == 1) 
		{
		quest::say("Is that your BREATH, or did something die in here?  Now go away!");
		}
	elsif ($random == 2) 
		{
		quest::say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
		}
	elsif ($random == 3) 
		{
		quest::say("Oh look, a talking lump of refuse.  How novel!");
		}
	}

sub attack_insult 
	{
	my $race = plugin::val('$race');
	my $random = int(rand(3));
	my $raceplural = $race . "s";

	if ($random == 0) 
		{
		quest::say("It's $raceplural like you that have ruined your own lands.  You'll not ruin mine!");
		}
	elsif ($random == 1) 
		{
		quest::say("$raceplural like you are better dead than alive.");
		}
	elsif ($random == 2) 
		{
		quest::say("$raceplural like you must die!");
		}
	}
