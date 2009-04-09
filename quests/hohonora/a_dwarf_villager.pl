sub EVENT_DEATH {
quest::signalwith(211087,1);
}

sub EVENT_SIGNAL {
quest::depop();
}