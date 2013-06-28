sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223191,10030,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }