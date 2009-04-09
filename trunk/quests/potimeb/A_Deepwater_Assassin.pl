sub EVENT_DEATH {
  quest::signalwith(223163,10010,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }