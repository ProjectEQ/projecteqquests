# Captain_Scareyface
# Under lvl 30 boss

sub EVENT_SPAWN {
	quest::shout("Booga Booga Booga!");
	quest::pathto(-782,-1319,-43);
}

sub EVENT_DEATH {
	quest::say("Church..the AI..its gone");
	quest::signalwith(20260,2);
}