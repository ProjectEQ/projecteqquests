sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60234 =>1 )) {
    #unlock door
  }
}