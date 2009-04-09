sub EVENT_SPAWN {

quest::setnexthpevent(80);

}


sub EVENT_HP {

if($hpevent == 80) {

quest::spawn2(207068,0,0,($x+5),$y,$z,$h);
quest::spawn2(207068,0,0,($x-5),$y,$z,$h);
quest::spawn2(207068,0,0,($x+5),($y+5),$z,$h);
quest::spawn2(207068,0,0,($x+5),($y-5),$z,$h);
quest::spawn2(207068,0,0,($x-5),($y+5),$z,$h);
quest::setnexthpevent(40);

}

if($hpevent == 40) {

quest::spawn2(207068,0,0,($x+5),$y,$z,$h);
quest::spawn2(207068,0,0,($x-5),$y,$z,$h);
quest::spawn2(207068,0,0,($x+5),($y+5),$z,$h);
quest::spawn2(207068,0,0,($x+5),($y-5),$z,$h);
quest::spawn2(207068,0,0,($x-5),($y+5),$z,$h);
}

}