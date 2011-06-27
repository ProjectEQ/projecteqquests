#needs live text
sub EVENT_SPAWN {
$counter = 0;
quest::settimer(1,1800);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm hungry, I require hynid.");
  }
}

sub EVENT_TIMER {
  quest::emote("falls to the ground, dead.");
  $npc->Depop(1);
  }
  
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58555 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
    }
  if (plugin::check_handin(\%itemcount, 58592 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58595 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58560 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58596 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58597 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58593 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58591 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58594 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if (plugin::check_handin(\%itemcount, 58590 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
  if($counter == 11) {
     $npc->Depop(1);
     }
plugin::return_items(\%itemcount);
}