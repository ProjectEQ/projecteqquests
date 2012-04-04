#spawns Iucid spirit of Abrams upon death

sub EVENT_DEATH {
     quest::spawn2(111147,0,0,$x,$y,$z,0);
}

sub EVENT_COMBAT {
	if($combat_state=1) {
		quest::say("Areeeeewwwww");
	}
}


