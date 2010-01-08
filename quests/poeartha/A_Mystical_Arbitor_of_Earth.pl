sub EVENT_SPAWN {
    quest::settimer(31,3600);
    quest::stoptimer(31);
}

sub EVENT_TIMER {
    if($timer == 31) {
        quest::depop();

        }

}

sub EVENT_DEATH {
        quest::delglobal("vine_ring_final");
        quest::delglobal("mud_ring_final");
        quest::delglobal("stone_ring_final");
        quest::delglobal("dust_ring_final");
        quest::spawn2(218068,0,0,$x,$y,$z,$h);
}