sub EVENT_SAY {
  if ($text=~/solusek ro/i) {
    quest::say("Solusek Ro is the Master of Fire and the Keeper of Power.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#End of File, Zone:soltemple  NPC:80021 -- a_seeker (generic)