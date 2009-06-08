sub EVENT_DEATH {
	quest::signalwith(162255,2,0);	
	quest::setglobal("exiled_dead",1,3,"D3");
}



