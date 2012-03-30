sub EVENT_DEATH {
  quest::spawn2(112085,0,0,$x,$y,$z,$h); #Kerd
}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("I will crush you for the master.");
	}
}