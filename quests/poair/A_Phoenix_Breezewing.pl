sub EVENT_DEATH {
	quest::signalwith(215455, 4);#Signal to #Mist_Trigger

	quest::spawn2(215477, 0, 0, $x+5, $y, $z, $h);
	quest::spawn2(215477, 0, 0, $x+5, $y, $z, $h);
}