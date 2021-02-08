# items: 17054
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 125 => 4)) {
    quest::say("Thank you."); #made up
    quest::summonitem(17054); # Item: Deck of Spontaneous Generation
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 126 => 4)) {
    quest::say("Thank you."); #made up
    quest::summonitem(17054); # Item: Deck of Spontaneous Generation
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 127 => 4)) {
    quest::say("Thank you."); #made up
    quest::summonitem(17054); # Item: Deck of Spontaneous Generation
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 128 => 4)) {
    quest::say("Thank you."); #made up
    quest::summonitem(17054); # Item: Deck of Spontaneous Generation
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount, 161 => 1)) {
    quest::say("Thank you."); #made up
    quest::summonitem(17054); # Item: Deck of Spontaneous Generation
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
} 