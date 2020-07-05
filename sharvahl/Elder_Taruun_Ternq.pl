#Rogue #3
#Zone:sharvahl  ID:155057 -- Elder_Taruun_Ternq
# items: 5564, 5570, 5566, 3465, 5558, 6158, 6275

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5564 => 1)) {
    quest::say("I see that Joharr introduced you to our cavern dwelling friends. This report shows that you were very successful on your last patrol. Your progress as a Taruun is most pleasing. You have shown us that you are ready to advance to the level of apprentice. I will send someone for your new cloak in a moment. While I am doing that, please use this bowl to prepare some spicy fish stew and take it to Kerr Tiparr in the Hollowshade outpost. It's not often that they get good food out there. If you don't remember the recipe, just ask cook Mylis. When you are done, please return with your old cloak and the empty pot. Always remember... Service to the community should always precede any thoughts of personal advancement.");
    quest::ding();
    quest::exp(1000);
    quest::faction(1530,10); # Faction: Taruun
    quest::summonitem(5570); # Item: Large Stewing Pot
  }
  if (plugin::check_handin(\%itemcount, 5566 => 1, 3465 => 1)) {
    quest::say("Very well done,$name. Take this cloak and wear it with pride. May it keep your silhouette hidden from our enemies and keep you safe from those things that may walk in shadows darker than ours. Your work is being noticed, young Taruun. Please keep a clear eye on the path that lies before you. Speak to Elam Arruk when you are ready to continue your training. You will need only to show him the cloak that I just gave you. He will know how to instruct you from there. Be well.");
    quest::shout("Hear me fellow Vah Shir! The Taruun have seen fit to escalate citizen $name to the rank of apprentice. He grows in strength and wisdom daily. We are proud as should you all be. May this student of our ways continue to progress and live worthy of our noble heritage.");
    quest::ding();
    quest::exp(2500);
    quest::faction(1530,20); # Faction: Taruun
    quest::summonitem(5558); # Item: Cloak of the Taruun Apprentice
  }
  if (plugin::check_handin(\%itemcount, 5558 => 1, 6158 => 1)) {
    quest::say("Well done. Take this new cloak and wear it with pride. You can now be called journeyman!");
    quest::shout("Hear me fellow Vah Shir! The Taruun have seen fit to escalate citizen $name to the rank of journeyman. He grows in strength and wisdom daily. We are proud as should you all be. May this student of our ways continue to progress and live worthy of our noble heritage.");
    quest::exp(10000);
    quest::summonitem(6275); # Item: Cloak of the Taruun Journeyman
    quest::summonitem(6158); # Item: Sonic Wolf Bane Dagger
  }
  plugin::return_items(\%itemcount);
}
#end of file  Zone:sharvahl  ID:155057 -- Elder_Taruun_Ternq
