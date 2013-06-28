sub EVENT_DEATH_COMPLETE {
	#signal our respective NoTarget NPC
	quest::signalwith(162278,1,0); #cursed_nine
}