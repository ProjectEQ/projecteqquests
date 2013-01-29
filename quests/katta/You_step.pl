sub EVENT_AGGRO {
	quest::emote("on a fresh grave and the soil around you springs to life!");
	quest::spawn2(quest::ChooseRandom(160432,160451,160431,160420),0,0,$x,$y,$z,$h);
	quest::depop_withtimer();
}
