sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hey, what do ye think yer lookin' at, ugly? Yeah, that's right. I called ye ugly. You gonna make somethin of it, $race? Yeah, I didn't think ye would. The last guy that looked at me wrong took me fist right in his mouth, laid him out flat on the ground! He been drinkin' an' all but he woulda been laid out flat even if he hadna been.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Clifus