sub EVENT_DEATH {
quest::signalwith(211081,1,1);
}

sub EVENT_SIGNAL {
quest::depop();
}