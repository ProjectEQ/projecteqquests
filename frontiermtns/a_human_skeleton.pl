# platinum speckled powder -- ranger epic
#
# items: 20475, 20476

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20475 => 1)) {
    quest::emote("begins to crack and disintegrate, its body collapsing into a pile of dust that scatters into the winds. On the ground you notice a locket on a fine, thin chain which you pick up.");
    quest::summonitem(20476); # Item: Silver Chained Locket
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: frontiermtns ID: 92084 NPC: a_human_skeleton

