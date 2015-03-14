# Test of Charm - enchanter epic - Enchanted Ruby
# 

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10633 => 1)) {
    quest::summonitem(10620);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: citymist ID: 90185 NPC: Wraith_of_Jaxion

