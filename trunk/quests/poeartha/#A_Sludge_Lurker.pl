sub EVENT_DEATH_COMPLETE {
	quest::spawn2(218042,0,0,($x + 15),$y,$z,$h);
	quest::spawn2(218042,0,0,($x - 15),$y,$z,$h);
	quest::spawn2(218042,0,0,$x,($y + 15),$z,$h);
	quest::spawn2(218042,0,0,$x,($y - 15),$z,$h);
	}	




