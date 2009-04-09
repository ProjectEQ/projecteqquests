sub EVENT_SPAWN {
quest::settimer(31,3600);
quest::stoptimer(31);
}
sub EVENT_TIMER {
if($timer == 31) {
quest::depop;
}
}
sub EVENT_DEATH {
quest::signalwith(218090,2,1);
}