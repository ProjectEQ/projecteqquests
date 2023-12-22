sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("May the shadows always guard you!  Darkness is where I find the most comfort and strength. I am fed by it.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}