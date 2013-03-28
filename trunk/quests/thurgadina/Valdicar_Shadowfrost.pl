sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well, hello there, my good fellow. I see you've somehow found your way into my private quarters, very adventurous. Normally I'd have you removed but it's refreshing to see someone with guts like you have. Too many people in this cit... err ... world have no guts. No initiative. Someday that will change, though.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Valdicar_Shadowfrost