sub EVENT_SPAWN {
	quest::depopall(297064);
	quest::spawn2(297064,0,0,-570,-930,-506,496);
	quest::spawn2(297064,0,0,-553,-919,-506,414);
	quest::spawn2(297064,0,0,-553,-905,-506,368);
	quest::spawn2(297064,0,0,-562,-890,-506,300);
	quest::spawn2(297064,0,0,-574,-886,-503,252);
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297215,74,0,$x,$y,$z,$h); #Shade
}
