sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name.  Are you just passing through the Reach as well?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}