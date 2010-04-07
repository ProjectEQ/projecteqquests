#needs live text
sub EVENT_SPAWN {
  $counter=0;
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm famished, I require tuna.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58459 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58389 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58461 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58455 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58454 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58462 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58458 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58457 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58460 =>1 )) {
    quest::faction( 363,5 );
        quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58456 =>1 )) {
    quest::faction( 363,5 );    
    quest::exp(100000);
    $counter += 1;
  }
  if($counter == 8) {
     quest::depop();
     }
plugin::return_items(\%itemcount);
}