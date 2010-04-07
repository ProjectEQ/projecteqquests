#needs live text

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm starved, I require barbequed cragbeast.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58531 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58535 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58532 =>1 )) {
      quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58534 =>1 )) {
    quest::faction( 363,5 );
  }
    if (plugin::check_handin(\%itemcount, 58538 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58533 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58536 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58480 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58537 =>1 )) {
    quest::faction( 363,5 );
  }
plugin::return_items(\%itemcount);
}
