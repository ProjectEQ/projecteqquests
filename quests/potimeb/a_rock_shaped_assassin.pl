sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223186,14018,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
