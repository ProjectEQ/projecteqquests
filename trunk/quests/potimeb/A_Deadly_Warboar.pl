sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223154,11030,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
