sub EVENT_DEATH {
quest::signalwith(211081,3,1);
}

sub EVENT_SIGNAL {
quest::depop();
}