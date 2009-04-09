sub EVENT_SPAWN {

quest::settimer(2,61);

}

sub EVENT_TIMER {

if($timer == 2) {

quest::depop();

}

}