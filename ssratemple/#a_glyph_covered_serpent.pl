sub EVENT_DEATH_COMPLETE {
	quest::signalwith(162255,1,0);
	quest::setglobal("glyphed_dead",1,3,"D3");
}