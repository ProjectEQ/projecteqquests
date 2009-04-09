sub EVENT_DEATH {
quest::signalwith(218094,4,1);quest::signalwith(218093,4,1);
}

sub EVENT_SPAWN {
quest::settimer(88,7200);
}

sub EVENT_TIMER {
if($timer == 88) {
quest::depop;
quest::stoptimer(88);
}
}