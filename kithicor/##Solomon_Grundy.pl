# Solomon Grundy
# Under lvl 50 boss

sub EVENT_SPAWN {
	quest::shout("Grundy smash!");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_AGGRO {
	quest::shout("Solomon Grundy, born on a Monday!");
}

sub EVENT_DEATH_COMPLETE {
	quest::emote("falls to the ground with a thump..and a couple twitches for good measure");
	quest::signalwith(20260,4); # NPC: ##Jack_Lanturn
}