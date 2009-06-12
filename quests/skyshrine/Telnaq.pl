sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $race, did you know Lord Yelinak has built a maze to protect the upper levels of the towers from invasion. Keep that in mind when traveling through the shrine.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Telnaq