sub EVENT_SPAWN {
  quest::emote("drips a green poison from its maw as it approaches.");
  quest::settimer("depop_hatchling",600);
}

sub EVENT_TIMER {
  if($timer == "depop_hatchling") {
    quest::depop();
  }
}
