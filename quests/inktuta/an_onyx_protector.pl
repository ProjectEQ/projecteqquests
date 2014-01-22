
sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::settimer(1,quest::ChooseRandom(20, 40, 60));
	}		
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::modifynpcstat("special_attacks","ABfHG");
		$npc->WipeHateList();
		quest::stoptimer(1);
		quest::settimer(2,1);
	} elsif ($timer == 2) {
		if ($y == 36 || $y == -41) {
			quest::stoptimer(2);
			quest::spawn2(296004,0,0,$x,$y,$z,$h);
			quest::depop();
		}
	}
}