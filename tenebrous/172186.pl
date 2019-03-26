sub EVENT_SPAWN {
	quest::settimer(1,1800);
}

sub EVENT_TIMER {
	quest::spawn2(172183,516092,0,$x,$y,$z,$h); # NPC: Kerzar_Clawtore
	quest::depop();
}