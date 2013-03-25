sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Can I help you with something? If you want anything to do with carpentry, somethin' I grew up with and was raised on, I can't help ya. Nope.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Fergus_Sawdust