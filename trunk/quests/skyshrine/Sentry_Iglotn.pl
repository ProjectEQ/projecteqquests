sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Move along.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Iglotn