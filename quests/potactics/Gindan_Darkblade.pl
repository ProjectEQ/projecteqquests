sub EVENT_SPAWN {
quest::setnexthpevent(51);
}

sub EVENT_HP {
if($hpevent == 51) {
	quest::spawn2(214115,0,0,($x + 10),$y,$z,$h);
	quest::spawn2(214115,0,0,($x - 10),$y,$z,$h);
	}
}