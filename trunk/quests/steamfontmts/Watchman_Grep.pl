sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::say("What a glorious machine the cargo clockwork is!!");
  quest::signal(448111,1);
}