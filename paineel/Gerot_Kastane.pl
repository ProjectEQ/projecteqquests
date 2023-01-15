# Part of SK Epic 1.0
# items: 14375, 14376, 14378, 14369

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if ($text=~/Hail/i && $faction >= 43 ) {
    quest::say("$name! My hero! I am at your service. I have been told to tell you all I know of the Head of the Valiant. Its construction is a mockery to the gods of Light, an abomination above all others. The method of creation of the Head of the Valiant was passed down through my family for centuries. All I require of you is the physical head of a valiant warrior. I have the rest of the materials right here to fashion this item for you.");
  }
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(404); # Faction: Truespirit
  if (($faction >= 42) && plugin::check_handin(\%itemcount, 14375 => 1)) {
    quest::say("At last! I have been waiting for my brother for weeks! We are doomed! Innoruuk will taint our seed into some perverse, twisted, maddened breed. The prophecy has begun to unfold and there are none capable of stopping it. Quickly, return this note to Marl, we must hide! We have failed the master! We must escape the hateful one's wrath!");
    quest::faction(404, 1); # Faction: Truespirit
    quest::summonitem(14376); # Item: Note to Marl
  }
  if (($faction >= 58) && plugin::check_handin(\%itemcount, 14378 => 1)) {
    quest::say("Good travels, dark one! May Innoruuk curse your enemies!");
    quest::faction(404, 7); # Faction: Truespirit
    quest::summonitem(14369); # Item: Head of the Valiant
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414

