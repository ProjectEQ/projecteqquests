sub EVENT_SIGNAL {
quest::depop();
}

sub EVENT_DEATH {
quest::signalwith(211081,7,1);
}