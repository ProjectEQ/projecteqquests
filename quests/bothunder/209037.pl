sub EVENT_SPAWN {
quest::settimer(7,600);
}

sub EVENT_TIMER {
if($timer == 7) {
quest::depop();
}
}