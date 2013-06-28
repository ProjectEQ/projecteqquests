sub EVENT_SIGNAL {
quest::depop();
}

sub EVENT_DEATH_COMPLETE {
quest::signalwith(211081,5,1);
}