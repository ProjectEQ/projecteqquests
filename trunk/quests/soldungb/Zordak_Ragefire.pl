sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("stares at you with unblinking eyes. A wide grin crosses Zordak's face and flames flicker in the depths of his eyes.");
    quest::say("Welcome to the new fortress of the Plasmatic Priesthood! It's a shame about Lord Nagafen's untimely death, really it is! Such a powerful and noble creature should not perish at the hands of mortals.");
  }
}

sub EVENT_ITEM {
  # 28054 :  Shimmering Pearl
  if (plugin::check_handin(\%itemcount,28054=>1)) {
    quest::emote("is engulfed by a shimmering blue light! An inhuman expression of rage crosses his face and flames leap in his eyes as he begins to vanish in the shimmering light! 'The Triumvirate may have succeeded in sending me back to my cursed homeland for the time being! I swear to you I shall return from Skyfire and destroy all of the Triumvirate Missionaries in flames!'");
    quest::summonitem(17175); # 17175  Zordak's Box of Bindings
    quest::summonitem(28059); # 28059  Swirling Pearl
    quest::depop();
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:soldungb  NPC:32038 -- Zordak_Ragefire

