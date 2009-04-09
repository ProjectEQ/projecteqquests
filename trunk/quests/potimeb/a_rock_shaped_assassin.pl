sub EVENT_DEATH {
    quest::signalwith(223186,14018,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
