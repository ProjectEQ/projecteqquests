sub EVENT_SPAWN {
  # use entity variable so each instance has his own copy.
  # Also because var{$mobid} does not work in EVENT_DEATH
  plugin::SEV($npc, "hasmap", 0);

  # Check to see if he should have the blurred map.  3.5%
  # Assigning loot locally since I can't find a way to see if he has
  # one if I let the loottables do this.
  $roll = plugin::RandomRange(1,200);
  if ($roll <= 7) {
    quest::addloot(13423, 1, 0); #Blurred Map
    plugin::SEV($npc, "hasmap", 1);
  }
}

sub EVENT_COMBAT {
  # Talkative when he enters combat IF he has the map.
  $myhasmap=plugin::REV($npc, "hasmap");
  if ($myhasmap && $combat_state == 1) {
    quest::say("Join.. Glug.. Tombor in his.. watery grave!!");
    $classplural = "${class}s";
    quest::say("$classplural like you always bring out the worst in me.");
  }
}

sub EVENT_DEATH_COMPLETE {
  # Talkative when he dies IF he has the map.
  $myhasmap = plugin::REV($npc, "hasmap");
  if ($myhasmap) {
    quest::say("My map!! You have my.. map.");
  }
}