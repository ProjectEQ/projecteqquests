sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I seem to be missing a tome.  Did I lend it to somebody?  Did somebody take it?  Do you know where it is?  What should I do!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}