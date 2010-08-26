sub EVENT_SPAWN {
  $event=0;
  $riddle=0;
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    $event=1;
    }
}
sub EVENT_SAY {
  if (($text=~/hail/i) && ($event == 1))  {
    $riddle = int(rand(15));
    quest::say("Have you come to hear my riddle?  Tell me when you are [ready]?  When you know the answer give me the correct item.");
    quest::creategroundobject(54068,-326,2071,635,0,600000);
    quest::creategroundobject(54069,-326,2075,635,0,600000);
    quest::creategroundobject(54070,-324,2077,635,0,600000);
    quest::creategroundobject(54071,-321,2079,635,0,600000);
    quest::creategroundobject(54072,-317,2079,635,0,600000);
    quest::creategroundobject(54073,-314,2076,635,0,600000);
    quest::creategroundobject(54074,-313,2074,634,0,600000);
    quest::creategroundobject(54075,-312,2069,634,0,600000);
    quest::creategroundobject(54076,-314,2065,635,0,600000);
    quest::creategroundobject(54077,-318,2063,635,0,600000);
    quest::creategroundobject(54078,-322,2062,636,0,600000);
    quest::creategroundobject(54079,-327,2064,636,0,600000);
    quest::creategroundobject(54080,-330,2067,636,0,600000);
    quest::creategroundobject(54081,-335,2066,635,0,600000);
    quest::creategroundobject(54082,-335,2077,635,0,600000);
  }
  if (($text=~/ready/i) && ($riddle == 1)) {
   quest::say("Who makes has no need of it, who buys has no use of it, who uses it can neither see nor feel it."); 
  }
   if (($text=~/ready/i) && ($riddle == 2)) {
  quest::say("What can be held in the left hand, but not in the right hand.");
  }
  if (($text=~/ready/i) && ($riddle == 3)) {
  quest::say("I drive men mad for love of me, Easily beaten, Never free.");
  }
  if (($text=~/ready/i) && ($riddle == 4)) {
  quest::say("I'm always hungry, I must always be fed, The finger I lick will soon turn red.");
  }
  if (($text=~/ready/i) && ($riddle == 5)) {
  quest::say("My life is measured in hours. I serve by being devoured. Thin, I am quick, Fat I am slow. Wind is my foe.");
  }
  if (($text=~/ready/i) && ($riddle == 6)) {
  quest::say("My mouth bears whiskers but no teeth. I have scales but I do not weigh. You can bait me with delicious food but please, no drink today.");
  }
  if (($text=~/ready/i) && ($riddle == 7)) {
  quest::say("Lovely and round, I shine with pale light, grown in darkness, a lady's delight.");
  }
  if (($text=~/ready/i) && ($riddle == 8)) {
  quest::say("I'm offered to the loved, and also to the dead. I come in many varied hues, most notably red. My pricks are known to pierce the skin, often resulting in wounds that bled.");
  }
  if (($text=~/ready/i) && ($riddle == 9)) {
  quest::say("When I am filled I can point the way, When I am empty Nothing moves me, I have two skins One without and one within.");
  }
  if (($text=~/ready/i) && ($riddle == 10)) {
  quest::say("I help to mature your spirits. When moistened I fulfill my purpose. Should I dry out, my task will fail and my quarry may be worthless.");
  }
  if (($text=~/ready/i) && ($riddle == 11)) {
  quest::say("I build up castles. I tear down mountains. I make some men blind, I help others to see. What am I?");
  }
  if (($text=~/ready/i) && ($riddle == 12)) {
  quest::say("When young, I am sweet in the sun. When middle-aged, I make you happy. When old, I am valued more than ever.");
  }
  if (($text=~/ready/i) && ($riddle == 13)) {
  quest::say("I scribble forms of the finest letter, and repel elements of the harshest weather. I am an arrow-aimer and a dust-breaker.");
  }
  if (($text=~/ready/i) && ($riddle == 14)) {
  quest::say("Searing 'cross the pitch-black skies, I scream in celebration, yet moments later, my outburst through, I am naught but imagination.");
  }
  if (($text=~/ready/i) && ($riddle == 15)) {
  quest::say("It floats on water, light as can be. A thousand men can't lift it free.");
  }
  if(($text=~/hail/i) && ($event == 2)) {
    quest::say("The door is open, hurry through!");
    quest::forcedooropen(4);
}
}
sub EVENT_ITEM {
if ((plugin::check_handin(\%itemcount,  54068=>1 )) && ($riddle == 1) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54068=>1 )) && ($riddle == 1)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
  
elsif ((plugin::check_handin(\%itemcount,  54069=>1 )) && ($riddle == 2) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54069=>1 )) && ($riddle == 2)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54070=>1 )) && ($riddle == 3) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54070=>1 )) && ($riddle == 3)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }  
  
elsif ((plugin::check_handin(\%itemcount,  54071=>1 )) && ($riddle == 4) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
 elsif ((plugin::check_handin(\%itemcount,  54071=>1 )) && ($riddle == 4)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54072=>1 )) && ($riddle == 5) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
 elsif ((plugin::check_handin(\%itemcount,  54072=>1 )) && ($riddle == 5)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54073=>1 )) && ($riddle == 6) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54073=>1 )) && ($riddle == 6)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 elsif ((plugin::check_handin(\%itemcount,  54074=>1 )) && ($riddle == 7) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54074=>1 )) && ($riddle == 7)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54075=>1 )) && ($riddle == 8) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54075=>1 )) && ($riddle == 8)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54076=>1 )) && ($riddle == 9) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
 elsif ((plugin::check_handin(\%itemcount,  54076=>1 )) && ($riddle == 9)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54077=>1 )) && ($riddle == 10) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54077=>1 )) && ($riddle == 10)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54078=>1 )) && ($riddle == 11) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54078=>1 )) && ($riddle == 11)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54079=>1 )) && ($riddle == 12) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54079=>1 )) && ($riddle == 12)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54080=>1 )) && ($riddle == 13) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
 elsif ((plugin::check_handin(\%itemcount,  54080=>1 )) && ($riddle == 13)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }

elsif ((plugin::check_handin(\%itemcount,  54081=>1 )) && ($riddle == 14) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54081=>1 )) && ($riddle == 14)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
 
elsif ((plugin::check_handin(\%itemcount,  54082=>1 )) && ($riddle == 15) && (defined $qglobals{bic} && $qglobals{bic} == 13)) {
   quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    quest::summonitem(67551);
    $event=2;
}
elsif ((plugin::check_handin(\%itemcount,  54082=>1 )) && ($riddle == 15)) {
    quest::say("Well done!  You may pass!");
    quest::forcedooropen(4);
    $event=2;
  }
  else {
   quest::say("That is incorrect");
    quest::forcedooropen(4);
  quest::spawn2(289035,0,0,-301,2093,634,171);
  quest::spawn2(289035,0,0,-302,2060,634,199);
  quest::spawn2(289035,0,0,-316,2040,648,239);
  quest::spawn2(289035,0,0,-334,2096,642,118);
  quest::spawn2(289035,0,0,-287,2079,634,182);
  quest::spawn2(289035,0,0,-258,2081,635,184);
  quest::spawn2(289035,0,0,-255,2065,634,187);
  quest::spawn2(289035,0,0,-251,2045,634,204);
  quest::spawn2(289035,0,0,-258,2091,634,184);
  quest::spawn2(289035,0,0,-261,2106,634,166);
  quest::spawn2(289035,0,0,-239,2069,634,191);
  quest::spawn2(289035,0,0,-239,2087,634,188);
    $event=2;
  } 
  plugin::return_items(\%itemcount);
}

