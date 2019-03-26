sub EVENT_DEATH_COMPLETE {
	quest::signalwith(162255,2,0); # NPC: #cursed_controller	
	quest::setglobal("exiled_dead",1,3,"D3");
}



