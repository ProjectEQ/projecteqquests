sub EVENT_DEATH_COMPLETE {
quest::signalwith(211081,2,1);
}

sub EVENT_SIGNAL {
quest::depop();
}