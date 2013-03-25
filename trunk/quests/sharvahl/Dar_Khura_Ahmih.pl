sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Dar_Khura_Ahmih