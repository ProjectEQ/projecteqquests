sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 3876 => 1)) {
    quest::emote("touches the coin to the back of her hand and then look up with a smile. 'Please take this back to it's source,' she says and nods. You feel the coin return to your hand. Your palm tingles slightly and then the sensation fades.");
    quest::summonitem(3877);
    quest::faction(96,2); #Eye of Seru
    quest::faction(139,-2); #Hand of Seru
    quest::faction(142,-2); #Heart of Seru
    quest::faction(284,2); #Seru
    quest::faction(141,-2); #Haven Smugglers
    quest::faction(350,-2); #Validus Custodus
    quest::faction(206,-2); #Magus Conlegium
    quest::exp(100);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#End of File zone: sseru ID: 159311 159574 -- Percontorius Ontu
#By Kovou