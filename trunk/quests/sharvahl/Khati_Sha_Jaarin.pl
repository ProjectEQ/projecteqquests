sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Greetings, how may I assist you?");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Khati_Sha_Jaarin