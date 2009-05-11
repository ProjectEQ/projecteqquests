sub EVENT_ITEM {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
