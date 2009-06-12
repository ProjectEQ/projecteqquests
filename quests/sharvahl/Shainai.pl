sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 4460 => 1)) {
    plugin::return_items(\%itemcount); #Merged from Not_Found.pl. Incomplete quest script.
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- #Shainai