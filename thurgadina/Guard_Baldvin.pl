sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Beyond these gates is the city of our people. Be respectful and obey our laws else I'll toss yer carcass into the pit meself.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Guard_Baldvin