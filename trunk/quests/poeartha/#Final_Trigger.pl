sub EVENT_SPAWN {

    quest::settimer("final",59);

}

sub EVENT_TIMER {

    if($timer eq "final" && defined $qglobals{vine_ring} && defined $qglobals{mud_ring} && defined $qglobals{stone_ring} && defined $qglobals{dust_ring}) {
        quest::spawn2(218053,0,0,1520.9,-2745.2,6.1,188.2);

        }

}