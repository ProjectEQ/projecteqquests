sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Good day, stranger. I would love to sit and chat with you but I don't much like gabbing it up with total strangers. I have other things to think on, Good day.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Hunter_Tarvin