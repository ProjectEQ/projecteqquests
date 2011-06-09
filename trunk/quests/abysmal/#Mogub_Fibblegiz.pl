sub EVENT_ITEM {
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}