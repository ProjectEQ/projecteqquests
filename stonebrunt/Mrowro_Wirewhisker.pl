# items: 6980, 6978, 2577
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 6980 => 1, 6978 => 1)) { #Kejek Spirit Powder, Fading Soul Orb
    quest::say("I require a Fading Soul Orb and Kejek Spirit Dust in order to perform the ritual that will free the imprisoned souls.");
    quest::emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
    quest::summonitem(2577); #Shattered Fading Soul Orb
    #quest::spawn2(quest::ChooseRandom(100223,100224,100225),$x+5, $y+5, $z+5, $h); #Apparitions
    quest::faction(473,10); #Kejek Village
    quest::faction(298,10); #Peace Keepers
    quest::exp(50000);
  }
  plugin::return_items(\%itemcount);
}
