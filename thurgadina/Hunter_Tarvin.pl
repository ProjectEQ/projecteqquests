sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Good day, stranger. I would love to sit and chat with you but I don't much like gabbing it up with total strangers. I have other things to think on, Good day.");
  }
  if($text=~/thing/i) {
    quest::say("Well, I am a hunter. I travel out over the wastes to the east and bring back hides and meat. The businesses pay me a bit of coin for what I bring back and I buy me a room at the inn for a little bit. Then I get low on cash and go back out into the wastes. Although lately I find myself out hunting more often than I stay in the city.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Hunter_Tarvin