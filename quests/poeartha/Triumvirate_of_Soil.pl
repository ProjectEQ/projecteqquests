sub EVENT_DEATH_COMPLETE {

quest::signalwith(218093,3,1);

}





sub EVENT_SPAWN {

quest::settimer(88,7200);

}



sub EVENT_TIMER {

if($timer == 88) {

quest::depop();

quest::stoptimer(88);

}

}