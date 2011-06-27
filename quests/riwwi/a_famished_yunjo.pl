#needs live text
#accepts beer braised tuna
#accepts garlic buttered tuna
sub EVENT_SPAWN {
  $counter=0;
  quest::settimer(1,1800);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm famished, I require tuna.");
  }
}
sub EVENT_TIMER {
  quest::emote("collapses from hunger.");
  $npc->Depop(1);
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
  if (plugin::check_handin(\%itemcount, 58427 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58428 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58429 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58430 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58431 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58432 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58433 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58434 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58435 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }  
  if (plugin::check_handin(\%itemcount, 58451 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if($counter == 11) {
     $npc->Depop(1);
     }
plugin::return_items(\%itemcount);
}