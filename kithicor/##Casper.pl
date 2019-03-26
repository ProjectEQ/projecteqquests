# Casper
# Under lvl 20 boss

sub EVENT_SPAWN {
	quest::shout("Casper! The Crazy Ghost! Coming to kill you all!");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_DEATH_COMPLETE {
	quest::say("You don't want to be my friend?");
	quest::signalwith(20260,1); # NPC: ##Jack_Lanturn
}