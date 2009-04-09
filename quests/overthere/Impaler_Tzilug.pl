# Test of Charm - enchanter epic - Enchanted Emerald
# 

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10634 => 1)) {
    quest::say("Your bidding has been done, now leave this land and never return.");
    quest::exp(10000);
    quest::summonitem(10621);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF Zone: overthere ID: 93149 NPC: Impaler_Tzilug

