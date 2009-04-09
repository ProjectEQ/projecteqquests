sub EVENT_DEATH {
  quest::signalwith(223154,11040,0);
  quest::emote("loses its semi-rigid consistency and deflates. The burbling noise and fetid scent are nauseating.");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
