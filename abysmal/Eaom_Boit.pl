sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("There are those that dismiss the importance of what is going on here.  Do I believe the end of Norrath is here?  Well, all I can say is I hope not.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}