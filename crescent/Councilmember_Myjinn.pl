sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm afraid we are too busy to speak to those who are unfamiliar with our customs. Perhaps speak to Council Aide Mystrana.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}