# Part of SK Epic 1.0
# items: 14377

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14377 => 1)) {
    quest::spawn2(39165, 0, 0, 464.4, 819, -678, 250); # NPC: Mummy_of_Glohnor
    quest::faction(404, 7); # Faction: Truespirit
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414

