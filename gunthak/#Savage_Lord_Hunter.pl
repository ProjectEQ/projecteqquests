sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 22503 =>3 )) {
    quest::summonitem(57004);
  }
  plugin::return_items(\%itemcount);
}