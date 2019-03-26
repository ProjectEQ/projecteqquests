sub EVENT_SPAWN {
	quest::depopall(297066);
	quest::spawn2(297066,0,0,-266,-906,-508,394); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297066,0,0,-267,-893,-513,334); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297066,0,0,-277,-885,-515,274); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297066,0,0,-293,-887,-511,208); # NPC: Tiv_Prayer_Chanter
	quest::spawn2(297066,0,0,-302,-896,-513,162); # NPC: Tiv_Prayer_Chanter
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297217,76,0,$x,$y,$z,$h); #Shade
}
