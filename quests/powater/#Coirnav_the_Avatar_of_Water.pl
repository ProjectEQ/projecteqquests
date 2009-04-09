sub EVENT_DEATH {
	quest::signalwith(216107,5,0);
	quest::spawn2(216066,0,0,$x,$y,$z,$h);
}
