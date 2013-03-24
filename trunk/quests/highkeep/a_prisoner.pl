sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Yes?"); #Text made up
  }
  if($text=~/fenn kaedrick/i) {
    quest::say("The dungeon is located on the lower levels of Highkeep. Do not venture there. It is off limits to visitors. If you wish to get someone released, you will have to speak with the jail clerk just before you get to the dungeon.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}