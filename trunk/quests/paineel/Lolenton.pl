sub EVENT_SPAWN {
  quest::settimer("repeat", 3); #Repeated shoot every 90 seconds
}

sub EVENT_TIMER {
  plugin::DoAnim(cheer);
}
