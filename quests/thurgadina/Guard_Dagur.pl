sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings and welcome to Thurgadin, $name. Ye best watch yer step on the bridge there, it can be a bit slippery.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Guard_Dagur