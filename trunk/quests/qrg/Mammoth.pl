sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12140 => 1)) {
    quest::summonitem(18809);
    quest::faction(267, 10);
    quest::faction(265, 10);
    quest::faction(159, 10);
    quest::faction(166, -30);
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414