sub EVENT_DEATH_COMPLETE {
quest::signalwith(211081,3,1);
}

sub EVENT_SIGNAL {
quest::depop();
}