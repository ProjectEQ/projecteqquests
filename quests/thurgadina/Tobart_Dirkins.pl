sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail and welcome to the Broken Glacier, $name. Ye'll find the bar downstairs and comfortable rooms up top. Can I interest you in one of our signature mugs, only a platinum piece they are!");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Tobart_Dirkins