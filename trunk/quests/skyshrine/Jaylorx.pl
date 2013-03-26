sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Watch out in the water. Yelinak keeps a few small fish there.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Jaylorx