sub EVENT_SPAWN {
quest::settimer(5,1200);
}

sub EVENT_TIMER {
if($timer == 5) {
quest::depop();
}
}