# items: 3876, 3877
sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3876 => 1)) {
    quest::emote("touches the coin to the back of her hand and then look up with a smile. 'Please take this back to it's source,' she says and nods. You feel the coin return to your hand. Your palm tingles slightly and then the sensation fades.");
    quest::summonitem(3877); # Item: Heavy Coin
    quest::faction(1485,2); #Eye of Seru
    quest::faction(1484,-2); #Hand of Seru
    quest::faction(1486,-2); #Heart of Seru
    quest::faction(1483,2); #Seru
    quest::faction(1542,-2); #Haven Smugglers
    quest::faction(1503,-2); #Validus Custodus
    quest::faction(1504,-2); #Magus Conlegium
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#End of File zone: sseru ID: 159311 159574 -- Percontorius Ontu
#By Kovou
