# Saryrn 
# Plane of Torment

# on aggro, spawn Sorrowsong - grid ID 1 (207052)
# every 10% spawn 4 blood ravens (207030), signal sorrowsong to restart despawn timer (signal 1)
# at 20%, tell sorrowsong to become targetable (signal 2)
# on death, summon planar projection

# Writtin by Romai, so you have someone to blame if I botch this :)


sub EVENT_SPAWN {
	quest::setnexthpevent(90);
}

sub EVENT_AGGRO {
	quest::spawn2(207052,1,0,53.8,-0.7,579.1,128.9);
}

sub EVENT_HP {
	if ($hpevent == 90) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(80);
	}

	if ($hpevent == 80) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(70);
	}

	if ($hpevent == 70) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(60);
	}

	if ($hpevent == 60) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(50);
	}

	if ($hpevent == 50) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(40);
	}

	if ($hpevent == 40) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(30);
	}	

	if ($hpevent == 30) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,1,0);
		quest::setnexthpevent(20);
	}

	if ($hpevent == 20) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
		quest::signalwith(207052,2,1);
		quest::setnexthpevent(10);
	}
	
	if ($hpevent == 10) {
		quest::spawn2(207030,0,0,($x +  5),$y,$z,$h);
		quest::spawn2(207030,0,0,($x -  5),$y,$z,$h);
		quest::spawn2(207030,0,0,$x,($y + 5),$z,$h);
		quest::spawn2(207030,0,0,$x,($y - 5),$z,$h);
	}
}

sub EVENT_DEATH {
	quest::spawn2(218068,0,0,$x,$y,$z,$h);
}