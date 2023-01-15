# crest of the faun
#
# items: 24860, 24861, 22855

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 24860 => 1, 24861 => 1)) {
    quest::summonitem(22855); # Item: Pile of Rubble
    quest::selfcast(1644); #pillar of fire
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}


# EOF zone: kael ID: 113429 NPC: a_bag_of_supplies

