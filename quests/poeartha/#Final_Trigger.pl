sub EVENT_SPAWN {
    quest::settimer("final",1);
}
sub EVENT_TIMER {
{
quest::stoptimer("final");
quest::settimer("final",1);
}
    if($timername == "final" && $vine_ring == 1 && $mud_ring == 1 && $stone_ring == 1 && $dust_ring == 1 && $arbitor_of_earth == undef) {
        quest::setglobal("arbitor_of_earth",1,3,"H4");
        quest::spawn2(218053,0,0,1520.9,-2745.2,6.1,188.2);
        }
}
