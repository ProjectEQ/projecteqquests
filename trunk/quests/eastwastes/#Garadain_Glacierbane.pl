sub EVENT_SPAWN {
  my $talk1=undef;
  quest::say("It is worse than I thought. Not only are they prepared for an attack, but they have the Kromrif here to help them. Our steel will be tested today. Be sure not to show the troops any fear.");
  quest::pause(2);
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1092 => 1)) {
    quest::say("Good work friend! The Dain will hear of this right away. We couldn't have defeated the Ry'gorr without your help. Take this ring as proof that you have served the Coldain well. You may wish to show it to the Seneschal should you ever stop in our fine city. Farewell, $name, it has been my pleasure knowing you.");
    quest::summonitem(30164);
#Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(49,30);
    quest::faction(67,30);
    quest::faction(188,-30);
    quest::faction(189,-30);
    quest::exp(2000000);
    quest::depop();
  }
}

sub EVENT_WAYPOINT {
  if ($talk1 == undef) {
    $talk1=$talk1+1;
    quest::settimer(30,10);
    quest::pause(200);
  }
  elsif ($talk1 == 1) {
    $talk1=$talk1+1;
    quest::settimer(27,600);
  }
}

sub EVENT_TIMER {
  if($timer == 30) {
    quest::stoptimer(30);
    quest::say("TROOPS! FALL IN!!");
    quest::settimer(31,10);
  }
  elsif($timer == 31) {
    quest::stoptimer(31);
    quest::say("Listen up men!");
    quest::settimer(32,20);
  }
  elsif ($timer == 32) {
    quest::stoptimer(32);
    quest::say("You all know why we're here. For decades these savages have menaced our people. Recent events have been too much to bear and the Dain has declared war! We will stop at nothing short of the Ry`gorr's annihilation!");
    quest::settimer(33,20);
  }
  elsif($timer == 33) {
    quest::stoptimer(33);
    quest::say("No longer will we tolerate their heathen presence in our lands! Never again will we mourn the loss of a Coldain to these pawns of the Kromrif! Our deeds here today shall make this land safe for Coldain for all time!");
    quest::settimer(34,20);
  }
  elsif($timer == 34) {
    quest::stoptimer(34);
    quest::say("Today the Ry`gorr fall! Tomorrow the Kromrif!!");
    quest::say("Fall out men!!");
    quest::settimer(35,45);
  }
  elsif($timer == 35) {
    quest::stoptimer(35);
    quest::say("Stay back from the initial charge, my friend. We will go directly for the chief once the troops are engaged. Follow me closely!");
    quest::settimer(36,30);
  }
  elsif($timer == 36) {
    quest::stoptimer(36);
    quest::say("For the Glory of Thurgadin! CHARGE!!");
    quest::settimer(37,65);
  }
  elsif($timer == 37) {
    quest::stoptimer(37);
    quest::pause(580);
  }
  elsif($timer == 27) {
    quest::stoptimer(27);
    quest::depop();
  }
}