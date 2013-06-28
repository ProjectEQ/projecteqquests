sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223188,14040,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }