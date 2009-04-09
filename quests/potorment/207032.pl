sub EVENT_SPAWN {

quest::settimer(2,1800);

}

sub EVENT_TIMER {

if($timer == 2) {

quest::depop();

}
}
