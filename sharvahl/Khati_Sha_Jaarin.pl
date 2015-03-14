sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Greetings, how may I assist you?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Khati_Sha_Jaarin