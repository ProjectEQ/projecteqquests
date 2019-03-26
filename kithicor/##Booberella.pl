# Booberella
# Under lvl 40 boss

sub EVENT_SPAWN {
	quest::shout("Boobs..");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_DEATH_COMPLETE {
	quest::say("We'll be right back! Then you can see more of my booooooobs!");
	quest::signalwith(20260,3); # NPC: ##Jack_Lanturn
}