sub EVENT_SPAWN {
quest::setnexthpevent(50);
}

sub EVENT_HP {

if($hpevent == 50) {
	quest::depop();
	quest::spawn2(218084,0,0,($x + 15),$y,$z,$h);
	quest::spawn2(218084,0,0,($x - 15),$y,$z,$h);
	quest::spawn2(218084,0,0,$x,($y + 15),$z,$h);
	quest::spawn2(218084,0,0,$x,($y - 15),$z,$h);
	quest::spawn2(218084,0,0,($x + 15),($y - 15),$z,$h);
	quest::spawn2(218084,0,0,($x + 15),($y + 15),$z,$h);
	quest::spawn2(218084,0,0,($x - 15),($y + 15),$z,$h);
	quest::spawn2(218084,0,0,($x - 15),($y - 15),$z,$h);
	quest::spawn2(218084,0,0,($x + 8),($y + 8),$z,$h);
	quest::spawn2(218084,0,0,$x,$y,$z,$h);
	}
}

