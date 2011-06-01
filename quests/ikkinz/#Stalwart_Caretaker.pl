sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60234 =>1 )) {
   quest::setglobal("ikkinzfirstdoor", 1,3,"H6");
  }
}