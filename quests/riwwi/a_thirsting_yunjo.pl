#needs live text
sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer(1,1800);
  }
  
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm thirsty, I require tea.");
  }
}

sub EVENT_TIMER {
  quest::emote("falls to the ground, perished");
  quest::depop();
  }

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58696 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
  }
    if (plugin::check_handin(\%itemcount, 58697 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58698 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58688 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58689 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58695 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58694 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58704 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58703 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58702 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58693 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58692 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58691 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58701 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58700 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58699 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
    if (plugin::check_handin(\%itemcount, 58690 =>1 )) {
    quest::faction( 363,5 );
    quest::exp(100000);
    $counter += 1;
}
if($counter == 11) {
     quest::depop();
     }
plugin::return_items(\%itemcount);
}
