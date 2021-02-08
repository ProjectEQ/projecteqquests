# items: 3878, 3879
sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3878 => 1)) {
    quest::emote("turns to look at you for a moment, but does not appear to notice that you made the swap.");
    quest::faction(1484,2); #Hand of Seru
    quest::faction(1485,-2); #Eye of Seru
    quest::faction(1486,-2); #Heart of Seru
    quest::faction(1483,2); #Seru
    quest::faction(1541,2); #Hand Legionnaires
    quest::faction(1503,-2); #Validus Custodus
    quest::faction(1504,-2); #Magus Conlegium
    quest::exp(100);
    quest::summonitem(3879); # Item: Official Seal of the Hand
  }
  plugin::return_items(\%itemcount);
}
#End of File zone: sseru ID: 159310 159535 159670 -- Consis Sinsolus
#By Kovou
