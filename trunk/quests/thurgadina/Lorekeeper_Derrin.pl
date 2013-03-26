sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings traveler. and welcome to the Temple of Lore. This library contains the sacred scrolls and texts of our ancestors, detailing both the history of their lives and the trials of our people. Previously the lore contained within these halls was forbidden to enter the hands of outsiders such as yourself. However, his majesty Dain Frostreaver IV has recently decreed that certain tomes of our heritage should be shared with the newly arrived offlanders so that they might better understand our culture. I have recently inscribed and translated several of these books which you may purchase for a modest donation.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lorekeeper_Derrin