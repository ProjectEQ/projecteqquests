sub EVENT_SPAWN {
  quest::settimer("repeat", 3);
}

sub EVENT_TIMER {
  plugin::DoAnim(dance);
}
