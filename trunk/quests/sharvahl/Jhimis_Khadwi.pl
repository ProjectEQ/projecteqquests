sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to my store! How may I help you?");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Jhimis_Khadwi