sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 12140 => 1)) {
      quest::summonitem(13383);
   }
plugin::return_items(\%itemcount);
}