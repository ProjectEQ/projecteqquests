#generic soulbinder quest
sub EVENT_SAY { 
  plugin::soulbinder_say($text);
}

sub EVENT_ITEM {
  quest::say("I do not want this.");
  plugin::return_items(\%itemcount);
}