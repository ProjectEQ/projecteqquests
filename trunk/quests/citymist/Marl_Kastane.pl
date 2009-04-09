# Part of SK Epic 1.0

sub EVENT_SAY {
  quest::say("Alas, I cannot be the one to carry the sword back to my people as proof in fear they will kill me to possess it for their own. I think a simple trade is in order. Perhaps you have a symbol or token of Lhanrc's that I could take back to the others to ease their worries?");
}

sub EVENT_ITEM {
  $faction = $client->GetCharacterFactionLevel(342);  
  if (($itemcount{14384} == 1) && ($faction >= 82)) {
    quest::say("Very good, I will go deliver this right away.");
    quest::summonitem(14383);
    quest::depop();
  }
}

# Quest by mystic414

