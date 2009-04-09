sub EVENT_DEATH {
	quest::spawn2(218042,0,0,($x + 15),$y,$z,$h);
	quest::spawn2(218042,0,0,($x - 15),$y,$z,$h);
	quest::spawn2(218042,0,0,$x,($y + 15),$z,$h);
	quest::spawn2(218042,0,0,$x,($y - 15),$z,$h);
	}	




