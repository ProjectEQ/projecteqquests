# Dracula
# Under lvl 60 boss

sub EVENT_SPAWN {
	quest::shout("I sense...mortals");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Haha! Silly mortals! You cannot kill me! I'm immor...");
	quest::signalwith(20260,5); # NPC: ##Jack_Lanturn
}