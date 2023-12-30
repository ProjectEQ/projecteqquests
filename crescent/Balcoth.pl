sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail thyself, $name! What brings you to these parts? Did you come in search of the treasure too?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}