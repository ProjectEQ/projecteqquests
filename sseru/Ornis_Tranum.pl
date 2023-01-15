# items: 3880, 3882
sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3880 => 1)) {
    quest::emote("gasps suddenly then falls still.");
    quest::summonitem(3882); # Item: Empty Poison Vial
    quest::faction(1485,-2); #Eye of Seru
    quest::faction(1487,2); #Shoulders of Seru
    quest::faction(1486,-2); #Heart of Seru
    quest::faction(1483,2); #Seru
    quest::faction(1502,-2); #Katta Castellum Citizens
    quest::faction(1505,-2); #Nathyn Illuminious
  }
  plugin::return_items(\%itemcount);
}


#End of File zone: sseru ID: 159309 159573 159669 -- Ornis Tranum
#By Kovou
