
sub EVENT_SPAWN {
    quest::settimer("despawn",3600);
}

sub EVENT_COMBAT {
	if ($combat == 1) {
		quest::stoptimer("despawn");
	} else {
		quest::settimer("despawn",3600);
	}
}

sub EVENT_TIMER {
	if($timer eq "despawn") {
        quest::depop();
    }

}

sub EVENT_DEATH_COMPLETE {
        quest::delglobal("vine_ring_final");
        quest::delglobal("mud_ring_final");
        quest::delglobal("stone_ring_final");
        quest::delglobal("dust_ring_final");
        quest::spawn2(218068,0,0,$x,$y,$z,$h);
}