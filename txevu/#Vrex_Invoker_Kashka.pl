sub EVENT_SPAWN {
	quest::depopall(297064);
	quest::spawn2(297064,0,0,-570,-930,-506,248);
	quest::spawn2(297064,0,0,-553,-919,-506,207);
	quest::spawn2(297064,0,0,-553,-905,-506,184);
	quest::spawn2(297064,0,0,-562,-890,-506,150);
	quest::spawn2(297064,0,0,-574,-886,-503,126);
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297215,74,0,$x,$y,$z,$h); #Shade
}