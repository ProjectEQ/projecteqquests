sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Oh. HI! Hey, you're an adventurer aren't you? Yeah I thought so from your worn clothes and weapons. Wow, is that a real bloodstain? Some day I'll be adventuring out there too, some day, they'll see...");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Thermin_Wandereye