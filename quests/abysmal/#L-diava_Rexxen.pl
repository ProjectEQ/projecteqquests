sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Time is short and my patience is thin. Please do not disturb those you do not have dealings with, it can be very bad for your health.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}