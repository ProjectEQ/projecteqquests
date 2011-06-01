# Part of SK Epic 1.0

sub EVENT_SAY {
  if ($faction >= 82) { #True Spirit
    quest::say("Alas, I cannot be the one to carry the sword back to my people as proof in fear they will kill me to possess it for their own. I think a simple trade is in order. Perhaps you have a symbol or token of Lhanrc's that I could take back to the others to ease their worries?");
  }
  else {
    quest::emote("seems to ignore you.");
  }
}

sub EVENT_ITEM {
  if ($faction >= 82) { #True Spirit
    if (plugin::check_handin(\%itemcount, 14384 => 1)) { #Lhranc's Token
      quest::say("Very good, I will go deliver this right away.");
      quest::summonitem(14383); #Innoruuk's Curse
      quest::depop();
    }
    else {
      quest::say("This is not what I seek.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::emote("seems to ignore you.");
    plugin::return_items(\%itemcount);
  }
}

# Quest by mystic414