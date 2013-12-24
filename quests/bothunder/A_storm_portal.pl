sub EVENT_SIGNAL {

	if($signal == 1) {
		quest::settimer(3,30); #spawn adds every 30s
	} elsif($signal == 2) {
		quest::stoptimer(3); #stop spawning
		quest::settimer(4,1200); #depop adds after 20 minutes
	}
}

sub EVENT_TIMER {

	if($timer == 3) {
		$npc->CastSpell(1037,209033);
		quest::spawn2(209107,0,0,$x,$y,$z,$h); #spawn add
	} elsif ($timer == 4) { #20 minutes, depop all adds
		quest::stoptimer(4);
		quest::depopall(209107);
	}

}

