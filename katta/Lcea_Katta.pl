sub EVENT_SAY {
  if (($text=~/arx key/i) && ($EarringVeracity3 eq "1")) {
    quest::say("The Arx Key, yes. I have read the compiled reports that have been brought to us and it seems to gain access to Arx Seru you need four shards, one from each Praesertum leader. When the time is ready each leader inserts their shard into the door of Arx Seru at the same time, and they are transported within the building. We need you to retrieve the four shards. When you have done so seek out Elnerick Augustleaf, and tell him that you serve Katta. His powers over the arcane are great and I believe he can form the shards into a single master key. Once you have received the Arx Key, place the seal given to you by Elnerick and your Runed earring in this jewel box and give it to me. I eagerly await your return.");
    quest::summonitem(17613); # 17613  Lcea's Jewel Box (container 2 slots)
  }
}

sub EVENT_ITEM {
  if ($EarringVeracity3 eq "1") {
    # 7000 :  Lcea's Jewel Box
    if (plugin::check_handin(\%itemcount,7000=>1)) {
      quest::say("Amazing! I had no doubt in your loyalty to Katta but I underestimated your ability to actually acomplish getting the Arx Key. Now that you have this key you must know what I ask of you next. Seru must be defeated, if there will ever be peace in Katta and truth spread among the people of  Sanctus Seru. Destroy this vile betrayer, bring me his head, and your Signet Earring. Go now before they have time to retaliate your previous attacks!");
      quest::summonitem(29860); # 29860  Signet Earring of Veracity
      quest::faction(52,20); #concillium universus
      quest::faction(284,-60); #seru
      quest::faction(142,-60); #heart of seru
      quest::exp(1000000);
    }
  }
  if (plugin::check_handin(\%itemcount, 29860 => 1, 7810 => 1)) {
    quest::say("This is astounding, I find myself at a loss for words. You have done Katta a great justice, Sanctus Seru will never be the same now that the truth is known. Their leader has fallen.");
    quest::summonitem(29861);
    quest::faction(52,50); #concillium universus
    quest::faction(284,-200); #seru
    quest::faction(142,-200); #heart of seru
    quest::exp(2000000);
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:katta  NPC:160375 -- Lcea_Katta
