sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3878 => 1)) {
    quest::emote("turns to look at you for a moment, but does not appear to notice that you made the swap.");
    quest::faction(139,2); #Hand of Seru
    quest::faction(96,-2); #Eye of Seru
    quest::faction(142,-2); #Heart of Seru
    quest::faction(284,2); #Seru
    quest::faction(138,2); #Hand Legionnaires
    quest::faction(350,-2); #Validus Custodus
    quest::faction(206,-2); #Magus Conlegium
    quest::exp(100);
    quest::summonitem(3879);
  }
  plugin::return_items(\%itemcount);
}
#End of File zone: sseru ID: 159310 159535 159670 -- Consis Sinsolus
#By Kovou