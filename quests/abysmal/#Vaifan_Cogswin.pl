sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Please do not disturb a genius at work. I have a very serious problem and little time to spend gabbing to just anyone.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}