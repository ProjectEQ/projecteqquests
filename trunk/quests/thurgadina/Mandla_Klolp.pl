sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What can I do fer ya? If yer lookin' fer a handout I got nothin for ya. Me darn husband wastes what little money we make on gamblin'. What a sucker! I don't know why I married him.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Mandla_Klolp