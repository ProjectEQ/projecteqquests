sub EVENT_DEATH {

    quest::signalwith(218092,4,1);

}

sub EVENT_SPAWN {

    quest::settimer(61,7200);

}

sub EVENT_TIMER {

    if($timer == 61) {

       quest::depop();

       quest::stoptimer(61);

    }

}