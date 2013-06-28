sub EVENT_DEATH_COMPLETE {
quest::signalwith(211081,1,1);
}

sub EVENT_SIGNAL {
quest::depop();
}