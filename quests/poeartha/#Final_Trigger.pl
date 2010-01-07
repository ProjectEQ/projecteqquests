sub EVENT_SPAWN {
    quest::settimer("final",59);
}

sub EVENT_TIMER {
    if($timer eq "final" && defined $qglobals{vine_ring_final} && defined $qglobals{mud_ring_final} && defined $qglobals{stone_ring_final} && defined $qglobals{dust_ring_final}) {
        quest::delglobal("vine_ring_final");
        quest::delglobal("mud_ring_final");
        quest::delglobal("stone_ring_final");
        quest::delglobal("dust_ring_final");
        quest::spawn2(218053,0,0,1520.9,-2745.2,6.1,188.2);
        }
}