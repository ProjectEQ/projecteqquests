sub EVENT_SPAWN {
	quest::spawn2(200042,0,0,($x+10),$y,$z,$h);
	quest::spawn2(200042,0,0,($x+10),($y+5),$z,$h);
	quest::spawn2(200042,0,0,($x+10),($y-10),$z,$h);
	quest::spawn2(200042,0,0,($x-10),$y,$z,$h);
	quest::spawn2(200043,0,0,$x,($y+10),$z,$h);
}

sub EVENT_DEATH_COMPLETE { 
	quest::spawn2(200055,0,0,-61.75,-.22,-288.5,192.4);
}

sub EVENT_SIGNAL {
	{ quest::depop(); }
}
