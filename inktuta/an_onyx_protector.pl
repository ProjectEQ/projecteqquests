
sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::settimer(1,quest::ChooseRandom(30, 45, 60));
	}		
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::modifynpcstat("special_attacks","ABfHGZ");
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