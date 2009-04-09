sub EVENT_SPAWN {
	quest::settimer(1,1);
	quest::settimer(2,1200);
}

sub EVENT_TIMER {
	{
		quest::stoptimer(1);
		quest::settimer(1,1);
	}

	if ($timer == 1 && $x == 50 && $y == 0) {
		$npc->CastSpell(3011,207052);
	}

	if ($timer == 1 && $x == 50 && $y == -150) {
		$npc->CastSpell(3011,207052);
	}

	if ($timer == 1 && $x == -50 && $y == -150) {
		$npc->CastSpell(3011,207052);
	}

	if ($timer == 1 && $x == -50 && $y == 0) {
		$npc->CastSpell(3011,207052);
	}

	if ($timer == 1 && $x == 50 && $y == 0 ) {
		$npc->CastSpell(3011,207052);
	}

	if ($timer == 2) {
		quest::stoptimer(1);
		quest::stoptimer(2);
		quest::depop();
	}
}

sub EVENT_SIGNAL {

	if ($signal == 1) {
		quest::stoptimer(2);
		quest::settimer(2,1200);
	}

	if ($signal == 2) {
		quest::stoptimer(1);
		quest::stoptimer(2);
		quest::spawn2(207065,1,0,$x,$y,$z,$h);
		quest::depop();
	}
}

# End of File  Zone: PoTorment  ID: 207052  -- Sorrowsong
# non targetable