sub EVENT_DEATH {

quest::signalwith(218093,2,1);

}





sub EVENT_SPAWN {

quest::settimer(88,7200);

}



sub EVENT_TIMER {

if($timer == 88) {

quest::depop_withtimer();

quest::stoptimer(88);

}

}