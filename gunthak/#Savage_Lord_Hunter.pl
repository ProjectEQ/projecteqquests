# items: 22503, 57004
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 22503 =>3 )) {
    quest::summonitem(57004); # Item: Taut Leather Swatch
  }
  plugin::return_items(\%itemcount);
}