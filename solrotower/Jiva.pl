sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::settimer(87, 30);
	} elsif ($combat_state == 0) {
		quest::stoptimer(87);
	}
}

sub EVENT_TIMER {
	if ($timer == 87) {
		my $ranNum = 0;
		$ranNum = int(rand(5));
		if($ranNum == 0) {
			#212067 - an_efreeti_makin
			quest::spawn2(212067, 0, 0, $x, $y, $z, $h);
		} elsif ($ranNum == 1) {
			#212068 - an_efreeti_adeel
			quest::spawn2(212068, 0, 0, $x, $y, $z, $h);
		} elsif ($ranNum == 2) {
			#212069 - an_efreeti_jiri
			quest::spawn2(212069, 0, 0, $x, $y, $z, $h);
		} elsif ($ranNum == 3) {
			#212070 - an_efreeti_seif
			quest::spawn2(212070, 0, 0, $x, $y, $z, $h);
		} elsif ($ranNum == 4) {
			#212071 - an_efreeti_nabil
			quest::spawn2(212071, 0, 0, $x, $y, $z, $h);
		}
	}
}

sub EVENT_DEATH_COMPLETE

{
quest::spawn2(202365,0,0,$x,$y,$z,$h);
}