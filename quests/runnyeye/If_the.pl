sub EVENT_SPAWN {
  quest::settimer("pass",24);
}

sub EVENT_TIMER {
 if ($timer eq "pass") {
  quest::emote("people of Rivervale hate the goblins so much, why do they not simply root this place out?  Probably because they are not that foolish.  'One with the Wall' indeed!");
  }
}
