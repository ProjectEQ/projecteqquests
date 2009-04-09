sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount,  19661 => 1, 19612 => 1 )) {
      quest::emote("fashions a grip out of the thorn drakeling scales then tests and polishes the blade of the machete.");
      quest::say("Yer another one of Megosh's trainees I suppose. This here's a fine weapon for a young Ranger of the Storm Reapers like yerself.");     
      quest::faction(218,5);
      quest::faction(77,5);
      quest::faction(133,5);
      quest::faction(208,5);
      quest::faction(369,-5);
      quest::exp(10);
      quest::summonitem(19687); 
}
   if(plugin::check_handin(\%itemcount, 19663 => 1, 19616 => 1)){
  quest::emote("fashions a grip out of the large fruit bat wing then tests and polishes the blade of the scimitar.");
  quest::say("Yer another one of Hibbs trainees I suppose. This here's a fine weapon for a young Druid of the Storm Reapers like yourself.");
  quest::faction(218,5);
  quest::faction(77,5);
  quest::faction(133,5);
  quest::faction(208,5); 
  quest::faction(369,-5); 
  quest::exp(10); 
  quest::summonitem(19686);
 }
if (plugin::check_handin(\%itemcount,  19662 => 1, 13060 => 1 )) {
      quest::emote("fashions a grip out of the large snake skin then tests and polishes the blade of the sword.");
      quest::say("Yer another one of Kaya's trainees I suppose. This here's a fine weapon for a young Paladin like yerself.");     
      quest::faction(218,5);
      quest::faction(77,5);
      quest::faction(133,5);
      quest::faction(208,5);
      quest::faction(369,-5);
      quest::exp(10);
      quest::summonitem(19685); 
}
plugin::return_items(\%itemcount);
}


#Scripted By: Fatty Beerbelly and Krich11
