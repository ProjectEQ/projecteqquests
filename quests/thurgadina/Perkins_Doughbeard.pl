sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("As far as I'm concerned there are only two arts in this world: alcohol and food. The Velium Keg is probably the best place to go for the former but I've got all yer needs for the latter covered right here.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Perkins_Doughbeard