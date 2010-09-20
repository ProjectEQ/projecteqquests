my $event;
my $question;

sub EVENT_SPAWN {
  $event = 0;
  $question = 0;
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    $event = 1;
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if ($event == 0) { #Event not ready
      quest::emote("ignores you.");
    }
    if ($event == 1) { #Event ready, not started
      quest::say("Have you come to hear my riddle? Tell me when you are [ready]. When you know the answer give me the correct item.");
    }
    if ($event == 2) { #Event in progress
      quest::say("I am waiting for the answer...");
    }
    if ($event == 3) { #Event success
      quest::say("The door is open, hurry through!");
      quest::forcedooropen(4);
    }
  }
  if (($text=~/ready/i) && ($event == 1)) {
    $event = 2;
    $question = int(rand(15)) + 1;
    quest::creategroundobject(54068,-326,2071,635,0,600000); #Coffin
    quest::creategroundobject(54069,-326,2075,635,0,600000); #Right Hand
    quest::creategroundobject(54070,-324,2077,635,0,600000); #Gold
    quest::creategroundobject(54071,-321,2079,635,0,600000); #Fire
    quest::creategroundobject(54072,-317,2079,635,0,600000); #Candle
    quest::creategroundobject(54073,-314,2076,635,0,600000); #Catfish
    quest::creategroundobject(54074,-313,2074,634,0,600000); #Pearl
    quest::creategroundobject(54075,-312,2069,634,0,600000); #Rose
    quest::creategroundobject(54076,-314,2065,635,0,600000); #Glove
    quest::creategroundobject(54077,-318,2063,635,0,600000); #Cork
    quest::creategroundobject(54078,-322,2062,636,0,600000); #Sand
    quest::creategroundobject(54079,-327,2064,636,0,600000); #Wine
    quest::creategroundobject(54080,-330,2067,636,0,600000); #Feather
    quest::creategroundobject(54081,-335,2066,635,0,600000); #Firework
    quest::creategroundobject(54082,-335,2077,635,0,600000); #Bubble
    if ($question == 1) {
      quest::say("Who makes has no need of it, who buys has no use of it, who uses it can neither see nor feel it.");
    }
    if ($question == 2) {
      quest::say("What can be held in the left hand, but not in the right hand.");
    }
    if ($question == 3) {
      quest::say("I drive men mad for love of me, Easily beaten, Never free.");
    }
    if ($question == 4) {
      quest::say("I'm always hungry, I must always be fed, The finger I lick will soon turn red.");
    }
    if ($question == 5) {
      quest::say("My life is measured in hours. I serve by being devoured. Thin, I am quick, Fat I am slow. Wind is my foe.");
    }
    if ($question == 6) {
      quest::say("My mouth bears whiskers but no teeth. I have scales but I do not weigh. You can bait me with delicious food but please, no drink today.");
    }
    if ($question == 7) {
      quest::say("Lovely and round, I shine with pale light, grown in darkness, a lady's delight.");
    }
    if ($question == 8) {
      quest::say("I'm offered to the loved, and also to the dead. I come in many varied hues, most notably red. My pricks are known to pierce the skin, often resulting in wounds that bled.");
    }
    if ($question == 9) {
      quest::say("When I am filled I can point the way, When I am empty Nothing moves me, I have two skins One without and one within.");
    }
    if ($question == 10) {
      quest::say("I help to mature your spirits. When moistened I fulfill my purpose. Should I dry out, my task will fail and my quarry may be worthless.");
    }
    if ($question == 11) {
      quest::say("I build up castles. I tear down mountains. I make some men blind, I help others to see. What am I?");
    }
    if ($question == 12) {
      quest::say("When young, I am sweet in the sun. When middle-aged, I make you happy. When old, I am valued more than ever.");
    }
    if ($question == 13) {
      quest::say("I scribble forms of the finest letter, and repel elements of the harshest weather. I am an arrow-aimer and a dust-breaker.");
    }
    if ($question == 14) {
      quest::say("Searing 'cross the pitch-black skies, I scream in celebration, yet moments later, my outburst through, I am naught but imagination.");
    }
    if ($question == 15) {
      quest::say("It floats on water, light as can be. A thousand men can't lift it free.");
    }
  }
}

sub EVENT_ITEM {
  if (($question == 1) && plugin::check_handin(\%itemcount,  54068 => 1)) { #Coffin
    $event = 3;
  }
  elsif (($question == 2) && plugin::check_handin(\%itemcount,  54069 => 1)) { #Right Hand
    $event = 3;
  }
  elsif (($question == 3) && plugin::check_handin(\%itemcount,  54070 => 1)) { #Gold
    $event = 3;
  }
  elsif (($question == 4) && plugin::check_handin(\%itemcount,  54071 => 1)) { #Fire
    $event = 3;
  }
  elsif (($question == 5) && plugin::check_handin(\%itemcount,  54072 => 1)) { #Candle
    $event = 3;
  }
  elsif (($question == 6) && plugin::check_handin(\%itemcount,  54073 => 1)) { #Catfish
    $event = 3;
  }
  elsif (($question == 7) && plugin::check_handin(\%itemcount,  54074 => 1)) { #Pearl
    $event = 3;
  }
  elsif (($question == 8) && plugin::check_handin(\%itemcount,  54075 => 1)) { #Rose
    $event = 3;
  }
  elsif (($question == 9) && plugin::check_handin(\%itemcount,  54076 => 1)) { #Glove
    $event = 3;
  }
  elsif (($question == 10) && plugin::check_handin(\%itemcount,  54077 => 1)) { #Cork
    $event = 3;
  }
  elsif (($question == 11) && plugin::check_handin(\%itemcount,  54078 => 1)) { #Sand
    $event = 3;
  }
  elsif (($question == 12) && plugin::check_handin(\%itemcount,  54079 => 1)) { #Wine
    $event = 3;
  }
  elsif (($question == 13) && plugin::check_handin(\%itemcount,  54080 => 1)) { #Feather
    $event = 3;
  }
  elsif (($question == 14) && plugin::check_handin(\%itemcount,  54081 => 1)) { #Firework
    $event = 3;
  }
  elsif (($question == 15) && plugin::check_handin(\%itemcount,  54082 => 1)) { #Bubble
    $event = 3;
  }
  else {
    quest::say("That is incorrect.");
    quest::spawn2(289035,0,0,-301,2093,634,171); #an_arisen_beludu
    quest::spawn2(289035,0,0,-302,2060,634,199); #an_arisen_beludu
    quest::spawn2(289035,0,0,-316,2040,648,239); #an_arisen_beludu
    quest::spawn2(289035,0,0,-334,2096,642,118); #an_arisen_beludu
    quest::spawn2(289035,0,0,-287,2079,634,182); #an_arisen_beludu
    quest::spawn2(289035,0,0,-258,2081,635,184); #an_arisen_beludu
    quest::spawn2(289035,0,0,-255,2065,634,187); #an_arisen_beludu
    quest::spawn2(289035,0,0,-251,2045,634,204); #an_arisen_beludu
    quest::spawn2(289035,0,0,-258,2091,634,184); #an_arisen_beludu
    quest::spawn2(289035,0,0,-261,2106,634,166); #an_arisen_beludu
    quest::spawn2(289035,0,0,-239,2069,634,191); #an_arisen_beludu
    quest::spawn2(289035,0,0,-239,2087,634,188); #an_arisen_beludu
  }
  if ($event == 3) {
    quest::say("Well done! You may pass!");
    quest::forcedooropen(4);
    if (defined($qglobals{bic}) && ($qglobals{bic} == 13)) {
      quest::summonitem(67551); #Vaifan's Temporary Power Cell D
    }
    $question = 0;
  }
    plugin::return_items(\%itemcount);
    return;
}