#needs live text

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm emaciated, I require crab.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58371 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58367 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58298 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58378 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58372 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58379 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58375 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58374 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58377 =>1 )) {
    quest::faction( 363,5 );
  }
  if (plugin::check_handin(\%itemcount, 58373 =>1 )) {
    quest::faction( 363,5 );
  }
plugin::return_items(\%itemcount);
}