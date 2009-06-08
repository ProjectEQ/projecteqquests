sub EVENT_DEATH {
	quest::signalwith(162255,1,0);
	quest::setglobal("glyphed_dead",1,3,"D3");
}