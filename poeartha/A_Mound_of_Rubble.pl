sub EVENT_DEATH_COMPLETE {

    quest::signalwith(218092,2,1);

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