sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Mind yourself in these parts! There are many dangers. Stay away from the water, if you know whats good for you.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::emote("looks very upset at your mention of the order. 'I cannot believe I have been banned from what little enjoyment can be found in Cabilis. Oh, well, I cannot argue with a legion order. Hand me the order so that I may sign it.'");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18240 => 1)) { #Legion Order (0 signed)
    quest::emote("grabs the order from your hand and mumbles something unpleasant and vaguely threatening. He then hands the signed order back to you.");
    quest::summonitem(18241); #Legion Order (1 signed)
    quest::exp(200);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:lakeofillomen  ID:5103 -- Trooper_Frogzin