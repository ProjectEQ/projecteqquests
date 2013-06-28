sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223154,11060,0);
  quest::emote("produces a bloodcurdling scream as she is cut down. Prone and dying, she sighs her final words, 'This cannot be. . .It is not yet my time to pass. An unlife as glorious as mine deserves continuance.'");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
