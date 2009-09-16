sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13844 =>1)) {
    quest::say("Tick.. Pop.. Access granted.");
    quest::summonitem(13212);
    quest::faction(176,1);
    quest::faction(91,1);
    quest::faction(115,1);
    quest::faction(71,-1);
    quest::faction(209,-1);
    quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}