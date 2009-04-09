sub EVENT_SPAWN {
    quest::settimer(31,3600);
    quest::stoptimer(31);
}
sub EVENT_TIMER {
    if($timer == 31) {
        quest::depop;
        }
}
sub EVENT_DEATH {
        quest::delglobal("arbiter_of_earth");
        quest::setglobal("arbiter_of_earth", 1, 5, "D3");
        quest::spawn2(218068,0,0,$x,$y,$z,$h);
}