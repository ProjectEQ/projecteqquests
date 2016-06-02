# Part of SK Epic 1.0

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14377 => 1)) {
    quest::spawn2(39165, 0, 0, 464.4, 819, -678, 125);
    quest::faction(342, 7);
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414

