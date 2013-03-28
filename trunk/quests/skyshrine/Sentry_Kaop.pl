sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I've seen your kind dashing about. Just watch your footing, you never know when you might slip and fall.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Kaop