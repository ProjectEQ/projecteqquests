sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 77645 => 1)) {
    quest::signalwith(300085,90,1);
    quest::me("The shard clicks into place and the crystal begins to pulse with energy.");
  }
}
