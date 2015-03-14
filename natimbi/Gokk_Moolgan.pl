sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to the island. If you want to try your hand at fishing I have everything you need.");
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}