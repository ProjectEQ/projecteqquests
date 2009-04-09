sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6883 => 1)) {
    quest::say("Oh wow! A rabbits foot!! Thank you so much. Here take this, I won't need this smelly thing any more.");
    quest::summonitem(3190);
    quest::faction(391,51);
    quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
    quest::say("I have no interest in this."); #fake text
  }
} 