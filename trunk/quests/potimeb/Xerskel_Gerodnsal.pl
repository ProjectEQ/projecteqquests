sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223154,11060,0);
  quest::emote("stares at his hands, a look of disbelief and horror on his countenance. 'Innoruuk, I have failed you!'");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
