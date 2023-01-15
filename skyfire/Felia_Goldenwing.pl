# Test of Charm - enchanter epic - Enchanted Sapphire
# 
# items: 10632, 10619

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10632 => 1)) {
    quest::summonitem(10619); # Item: Enchanted Sapphire
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: skyfire ID: 91081 NPC: Felia_Goldenwing

