# Captain_Scareyface
# Under lvl 30 boss

sub EVENT_SPAWN {
	quest::shout("Booga Booga Booga!");
#commenting move until pathing is fixed
	#quest::moveto(-782,-1319,-43);
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Church..the AI..its gone");
	quest::signalwith(20260,2); # NPC: ##Jack_Lanturn
}