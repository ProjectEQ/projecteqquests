sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3880 => 1)) {
    quest::emote("gasps suddenly then falls still.");
    quest::summonitem(3882);
    quest::faction(96,-2); #Eye of Seru
    quest::faction(298,2); #Shoulders of Seru
    quest::faction(142,-2); #Heart of Seru
    quest::faction(284,2); #Seru
    quest::faction(168,-2); #Katta Castellum Citizens
    quest::faction(228,-2); #Nathyn Illuminious
  }
  plugin::return_items(\%itemcount);
}


#End of File zone: sseru ID: 159309 159573 159669 -- Ornis Tranum
#By Kovou