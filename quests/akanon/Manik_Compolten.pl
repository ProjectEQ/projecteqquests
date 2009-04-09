sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, young one. I am Manik Compolten, High Watchman. Are you a [new warrior] or an [experienced fighter]?");
}
if($text=~/i am a new warrior/i){
quest::say("It is always good to see new blood amongst the Gemchoppers. I have a small task for you. Take this keycard. I will give you only one at a time. Use each to obtain blackboxes for the C series clockworks. I am sure you are familiar with the clockworks. When you are done, bring them all to me. Let me know if you need another keycard.");
quest::summonitem("13844");
}
if($text=~/i am an experienced fighter/i){
quest::say("Good.  I require your talents to destroy rogue clockworks.  After we sent the clockworks to destroy the Asylum of the Mad we found some of the clockworks went haywire and never returned.  We must destroy them, not for the safety of the people, but to keep our technology from falling into the hands of any other nation. Go to the Steamfont Mountains and return their rogue blackboxes to me."); }
}

sub EVENT_ITEM {
 #do all other handins first with plugin, then let it do disciplines
  if(plugin::check_handin(\%itemcount, 13208 => 1)) {
    quest::say("Ah! Excellent work! I think we may have further use for you if you like.");
    quest::exp(100);
    quest::givecash(1,3,1,2);
    quest::faction(115,3); #gem choppers
    quest::faction(176,3); #King ak'anon
    quest::faction(210,10); #Merchants of Ak'Anon
    quest::faction(39,-10); #Clan Grikbar
    quest::faction(71,-10); #Dark Reflection
  }
  if (plugin::check_handin(\%itemcount, 13212 =>1, 13211 =>1, 13213 =>, 13214 =>1 )) {
  quest::say("Ah!! I see you had no problem finding all of the C series clockworks. Good work. Here. Take this blackbox. We received it from Clockwork 27C. Take it to Jogl Doobraugh. He is the operator of the only blackbox definer in Ak'Anon. He is out at the windmills checking on their operation.");
  quest::summonitem(13209);
  quest::faction(115,1); #gem choppers
    quest::faction(176,1); #King ak'anon
    quest::faction(210,1); #Merchants of Ak'Anon
    quest::faction(39,-1); #Clan Grikbar
    quest::faction(71,-1); #Dark Reflection
    quest::exp(500);
    quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 13215 => 1)) { #text is not per live. Ned original
    quest::say("What's this? You've found and smashed Red V?! Amazing! Wonderful! Take this as a sign of my thanks!");
    quest::summonitem(quest::chooserandom(13219, 13219, 13220, 13220, 1013, 1018, 1015, 1019, 1022, 1023, 1024, 1017, 1016, 1020, 1014, 1021));
    quest::faction(115,1); #gem choppers
    quest::faction(176,1); #King ak'anon
    quest::faction(210,1); #Merchants of Ak'Anon
    quest::faction(39,-1); #Clan Grikbar
    quest::faction(71,-1); #Dark Reflection
    quest::exp(500);
    quest::ding();
    quest::givecash(1,3,0,0);
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:akanon  ID:55155 -- Manik_Compolten 
