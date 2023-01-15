# items: 6883, 3190
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6883 => 1)) {
    quest::say("Oh wow! A rabbits foot!! Thank you so much. Here take this, I won't need this smelly thing any more.");
    quest::summonitem(3190); # Item: Ivy Etched Gauntlets
    quest::faction(437,51); # Faction: Denizens of Mischief
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
} 
