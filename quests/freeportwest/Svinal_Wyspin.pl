sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome, welcome, welcome! This is the Emporium. If we don't have it, we can get it!!");
  }
  if ($text=~/boat beacon/i) {
    quest::say("What!!? Looking for a boat beacon? We may be getting one from Ak'Anon in about a year. You can always try to make one. Find a greater lightstone, a metal disk and a copper band. If you have a beacon mount, go to a forge and combine them all. It's not that hard, but it's not that easy, either.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}