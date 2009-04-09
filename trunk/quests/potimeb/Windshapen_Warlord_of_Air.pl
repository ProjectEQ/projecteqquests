sub EVENT_DEATH {
  quest::signalwith(223191,10030,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }