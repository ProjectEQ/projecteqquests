sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You got a dispute to settle or are ya here to yap it up?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lieutenant_Grimur