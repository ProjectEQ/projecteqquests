sub EVENT_SPAWN {
  #fail timer
  quest::settimer(9,1200);
  #leash timer
  quest::settimer(4,1);
}

sub EVENT_DEATH    {
  #signal to Giwin to give flags.
  quest::signalwith(206038,1,1);
}

sub EVENT_TIMER {
  if($timer == 9) {
    #if targetable version has beenup 30 minutes depop him.
    quest::depop();
  }
  if($timer == 4 && ($x < 1010 || $x > 1240)) {
    #leash
    $npc->GMMove(1125,0,12.5,0);
    #signal to giwin about being out of room
    quest::signalwith(206038,2,1);
  }
}