sub EVENT_SPAWN {
	quest::depopall(297065);
	quest::spawn2(297065,0,0,-801,-497,-511,104);
	quest::spawn2(297065,0,0,-790,-511,-515,34);
	quest::spawn2(297065,0,0,-772,-513,-516,490);
	quest::spawn2(297065,0,0,-755,-501,-507,416);
	quest::spawn2(297065,0,0,-754,-484,-511,360);
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297216,75,0,$x,$y,$z,$h); #Shade
}
