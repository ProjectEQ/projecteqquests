sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I'm terribly sorry, good fellow, but this residence is privately owned. Your presence here is quite disconcerting for my master. I implore you to take your leave. Thaaaaanks.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Yates_the_Butler