sub EVENT_AGGRO {
  quest::say("If you were looking to play war, mortals, you will get all that and more. Prepare to soak my battlefield in your blood!");
}

sub EVENT_DEATH_COMPLETE {
  quest::signalwith(223154,11050,0);
  quest::emote("coughs, 'Not bad, for mere amateurs. A commendable exertion on your part.'");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
