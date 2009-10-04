sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You have no business here. Get lost!"); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I do not want that.");
  plugin::return_items(\%itemcount);
}

sub EVENT_ATTACK {
  quest::say("Prepare to die!");
}

sub EVENT_SIGNAL {
  quest::depop();
}