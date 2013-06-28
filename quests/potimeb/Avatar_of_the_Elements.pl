sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223154,11090,0);
  quest::emote("teeters, then comes crashing down. The force of impact is tremendous, shaking what you imagine to be the entire plane.");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
