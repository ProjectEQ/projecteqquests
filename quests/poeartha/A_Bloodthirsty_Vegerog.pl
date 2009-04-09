sub EVENT_SPAWN {
quest::settimer(101,7200);
}

sub EVENT_TIMER {
if($timer == 101) {
quest::stoptimer(101);
quest::depop;
}
}

sub EVENT_DEATH {
quest::signalwith(218091,1,1);
}