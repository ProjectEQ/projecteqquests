sub EVENT_SPAWN {
  quest::settimer("pass",30);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("invades your thoughts: 'Beware mortal!  This land is marked by Veeshan, and is sacred to her brood.  None but Dragonkin are welcome here.  Your life is forteit if you proceed.  Ignore this message at your peril!'");
  }
}