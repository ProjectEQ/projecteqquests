sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223189,14038,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }