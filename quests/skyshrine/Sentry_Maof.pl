sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I'd watch out for the cubes. They've been getting hostile lately.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Maof