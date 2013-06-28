sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223154,11080,0);
  quest::emote("whines pitifully as it stumbles and topples over.");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
