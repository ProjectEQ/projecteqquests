#needs live text
sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer(1,1800);
  }
  
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm emaciated, I require crab.");
  }
}

sub EVENT_TIMER {
  quest::emote("falls to the ground dead");
  quest::depop();
  }

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 58361 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
    }
  if (plugin::check_handin(\%itemcount, 58288 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
    }
  if (plugin::check_handin(\%itemcount, 58296 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
    }
  if (plugin::check_handin(\%itemcount, 58356 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
    }
  if (plugin::check_handin(\%itemcount, 58371 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58367 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58298 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58378 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58372 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58379 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58375 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58374 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58377 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58373 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if($counter == 11) {
     quest::depop();
     }
plugin::return_items(\%itemcount);
}