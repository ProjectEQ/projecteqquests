# Charlie Brown
# Inform people of the event in Kithicor

sub EVENT_SPAWN {
	quest::settimer(1,180);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::stoptimer(1);
		quest::settimer(1,180);
		if (!defined $qglobals{halloween_great_pumpkin}) {
			quest::shout("Help! Everyone! The undead are preparing to attack Freeport! We plan to head them off in the Kithicor Forest. Please, lend us your strength!");
		}
	}
}