sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30961 => 1)) {
    quest::say("Oh $name! This is a whisperling, and she is beautiful! You must find a way to free her of this anchor. Take her to Ragnar, he may know what to do. Let me put her in this bag to keep her safe for now.");
    quest::summonitem(30962);
    #quest::faction("Not_Found","1"); Need faction to replace Not_Found
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155113 -- Dar_Khura_Shavra