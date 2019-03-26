sub EVENT_SPAWN {
	quest::depopall(297062);
	quest::spawn2(297062,0,0,-538,-56,-476,222); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297062,0,0,-548,-64,-477,172); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297062,0,0,-552,-80,-480,128); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297062,0,0,-550,-94,-480,76); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297062,0,0,-537,-104,-478,32); # NPC: Tiv_Prayer_Chanter
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297213,73,0,$x,$y,$z,$h); #Shade
}
