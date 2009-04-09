sub EVENT_SPAWN {
quest::say("Why have you awakened me mortals?");
}

sub EVENT_DEATH {
  quest::signalwith(278125,93,0);
  }