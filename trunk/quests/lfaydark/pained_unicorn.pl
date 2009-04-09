sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 20691 => 1, 20692 => 1, 20693 => 1)){
  quest::say("Take my horn, symbol of Faydwer, now cleansed, to the gnome priest. It is anathema to him, to the corrupt forces in his soul, channeled into him by his dark god and will release the grip of corruption on the land. He is close, I can feel it.");
  quest::summonitem("20694"); 
 }
}
