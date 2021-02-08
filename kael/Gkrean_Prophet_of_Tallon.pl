# Coldain Books of Tactics
#
# items: 24987, 24988, 25037, 25038, 25039, 25042

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You have entered the sacred temple of Tallon Zek. This is the Temple of Tactics, where we teach what must be done to achieve goals in the most efficient manner.");
  }
  if ($text=~/teach me/i) {
    quest::say("I cannot teach one of your kind the arts of war. I must teach the other Kromzek at this time. If you were to serve the Temple of Tactics I might consider giving you a few words of wisdom.");
  }
  if ($text=~/serve the temple/i) {
    quest::say("The great father of war, Rallos Zek, wishes the destruction of the inferior race known as the Coldain. As the high priest of Tallon Zek, I see that they use great tactics to evade destruction. Find the ones who teach these tactics to the other Coldain and bring back the books that contain the ancient
Coldain tactics and strategies. Do not waste my time without a scroll or book that those tiny beasts hold");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 24987 => 1) || plugin::check_handin(\%itemcount, 24988 => 1)) {
    quest::say("You are a brave little beast to gain this tome. Let me impart a bit of wisdom to you. Tactics must change - if you do not ever adapt to new surroundings, environments and rules, you will surely perish.");
    quest::summonitem(quest::ChooseRandom(25037,25038,25039,25042)); # Item(s): Circlet of Tallon (25037), Book of Tactics (25038), Gauntlets of Iron Tactics (25039), Bracelet of Sacrifice (25042)
    quest::exp(50000);
    quest::faction(419,30); #kromrif
    quest::faction(448,30); #kromzek
    quest::faction(429,30); #tormax
    quest::faction(430,-90); #CoV
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: kael ID: 113155 NPC: Gkrean_Prophet_of_Tallon

