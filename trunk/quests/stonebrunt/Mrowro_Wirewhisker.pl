sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 6980 => 1, 6978 => 1)) { #Kejek Spirit Powder, Fading Soul Orb
    quest::say("I require a Fading Soul Orb and Kejek Spirit Dust in order to perform the ritual that will free the imprisoned souls.");
    quest::emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
    quest::summonitem(2577); #Shattered Fading Soul Orb
    #quest::spawn2(quest::chooserandom(XXXX,XXXX,XXXX,XXXX),$x+5, $y+5, $z+5, $h); #Apparitions
    quest::faction(172,10); #Kejek Village
    quest::faction(247,10); #Peace Keepers
    quest::exp(50000);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}