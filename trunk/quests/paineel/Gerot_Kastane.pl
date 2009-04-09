# Part of SK Epic 1.0

sub EVENT_SAY {
  $faction = $client->GetCharacterFactionLevel(342);
  if ($text=~/Hail/i && $faction >= 43 ) {
    quest::say("$name! My hero! I am at your service. I have been told to tell you all I know of the Head of the Valiant. Its construction is a mockery to the gods of Light, an abomination above all others. The method of creation of the Head of the Valiant was passed down through my family for centuries. All I require of you is the physical head of a valiant warrior. I have the rest of the materials right here to fashion this item for you.");
  }
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(342);

  if ($itemcount {14375} == 1 && $faction >= 42) {
    quest::say("At last! I have been waiting for my brother for weeks! We are doomed! Innoruuk will taint our seed into some perverse, twisted, maddened breed. The prophecy has begun to unfold and there are none capable of stopping it. Quickly, return this note to Marl, we must hide! We have failed the master! We must escape the hateful one's wrath!");
    quest::faction(342, 1);
    quest::summonitem(14376);
  }

  if ($itemcount {14378} == 1 && $faction >= 58) {
    quest::say("Good travels, dark one! May Innoruuk curse your enemies!");
    quest::faction(342, 7);
    quest::summonitem(14369);
  }
}

# Quest by mystic414

