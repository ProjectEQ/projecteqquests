# Test of Charm - enchanter epic - Enchanted Ruby
# 
# items: 10633, 10620

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10633 => 1)) {
    quest::summonitem(10620); # Item: Enchanted Ruby
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: citymist ID: 90185 NPC: Wraith_of_Jaxion

