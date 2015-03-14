sub EVENT_AGGRO {
	quest::spawn2(quest::ChooseRandom(173077,173093),0,0,$x,$y,$z,$h);
	quest::depop_withtimer();
}
