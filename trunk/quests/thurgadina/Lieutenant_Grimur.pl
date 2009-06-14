sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You got a dispute to settle or are ya here to yap it up?");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lieutenant_Grimur