sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You have no business here. Get lost!"); #Text made up
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::depop();
}