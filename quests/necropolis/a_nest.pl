sub EVENT_AGGRO {
	quest::spawn2(123132,0,0,$x,$y,$z,$h);
	quest::spawn2(123132,0,0,$x-2,$y,$z,$h);
	quest::spawn2(123132,0,0,$x+2,$y,$z,$h);
	quest::spawn2(123132,0,0,$x,$y-2,$z,$h);
	quest::spawn2(123132,0,0,$x,$y+2,$z,$h);
	quest::spawn2(123132,0,0,$x+1,$y+1,$z,$h);
	quest::depop_withtimer();
}
