sub EVENT_DEATH {
  quest::signalwith(223154,11030,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
