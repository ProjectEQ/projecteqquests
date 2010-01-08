sub EVENT_SPAWN {
    quest::settimer("final",59);
}

sub EVENT_TIMER {
    if($timer eq "final" && defined $qglobals{vine_ring_final} && defined $qglobals{mud_ring_final} && defined $qglobals{stone_ring_final} && defined $qglobals{dust_ring_final} && !defined $qglobals{arbitor_of_earth}) {
        quest::setglobal("arbitor_of_earth", 1, 5, "H4");
        quest::spawn2(218053,0,0,1520.9,-2745.2,6.1,188.2);
        }
}