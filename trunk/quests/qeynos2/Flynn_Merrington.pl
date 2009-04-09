sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Oh look.. another gnoll pup. This bar is too rough for the likes of you. Why don't you try Fish's. We don't need any more regulars here, chump!");
  }
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13122 => 1)) {
    quest::say("Well, now... That's cutting out the middle man. Thanks, chum! Now, beat it!");
    quest::faction( 33, -20);
    quest::faction( 217, 20);
    quest::faction( 53, -20);
    quest::faction( 135, 20);
    quest::faction( 164, -20);
    quest::exp(500);
    quest::summonitem(13123);
  }
}