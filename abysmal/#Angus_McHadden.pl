sub EVENT_ITEM {
  plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
  plugin::return_items(\%itemcount);
}