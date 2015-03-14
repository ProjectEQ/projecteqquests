sub EVENT_DEATH_COMPLETE {
quest::signalwith(211087,1);
}
sub EVENT_SIGNAL {
quest::depop();
}