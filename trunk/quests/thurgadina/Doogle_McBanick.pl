sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome ta me bar. I suggest ye sit down and have a drink cause if'n ye ai'nt drinkin ye've no business bein 'ere.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Doogle_McBanick