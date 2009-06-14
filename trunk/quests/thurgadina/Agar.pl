sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What ye want? A torch? I be puttin' that torch some place fer ya if that's what ye want. Right there in that satchel o' yers if I do say meself. Got the best prices, I do, even fer ya outlanders. Mebbe ye should take a gander round me store, ye may be openin' that coin purse then, eh?");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Agar