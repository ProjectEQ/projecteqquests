sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("There is rumor that a young N`Ogard is lost in the maze. Perhaps you should go find the father and see if you can help.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Wegylx