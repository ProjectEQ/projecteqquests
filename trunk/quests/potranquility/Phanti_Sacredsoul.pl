sub EVENT_SPAWN
{
	quest::settimer("try_sit", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_sit");
}

sub EVENT_SAY
{
	if($text=~/Hail/i)
	{
		quest::say("Oh, hello. I am sorry, I did not see you approach. I have been giving all of my attention to poor [Phanti] here.");
	}
	elsif($text=~/Phanti/i)
	{
		quest::say("A few days ago Phanti started to get very ill, while she was preparing herself for another trip into [Saryrn's domain]. We are not sure exactly was caused her to fall into this malaise, although we do have our [suspicions].");
	}
	elsif($text=~/Saryrn's domain/i)
	{
		quest::say("Torment, the Plane of Pain. She was doing some research on the denizens there, should you [help] us, I could grant you and your companions entry. The key will not do Phanti any good for quite some time.");
	}
	elsif($text=~/Help/i || $text=~/Suspicions/i)
	{
		quest::say("Recently, the portal from the Plane of Disease has been unusually active. People have been reporting strange sounds from around the portal at night, and a few of our trackers have seen strange, almost rodent like, footprints. Our best guess is that one of the denizens of the Plane of Disease managed to make its way into our plane. If this is true, it may explain the unnaturally quick manifestation of the disease. Perhaps, the bile from one of the rodents will help us learn of the cause, and hopefully a cure.");
	}
}