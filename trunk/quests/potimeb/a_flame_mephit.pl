sub EVENT_DEATH {
    quest::signalwith(223190,14028,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
