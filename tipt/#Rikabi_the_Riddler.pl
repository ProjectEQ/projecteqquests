my $question = 0;
my $event = 0;
my $instid = 0;

sub EVENT_SAY {
  if($instid == 0) {
    $instid = quest::GetInstanceID("tipt",0);
  }
  if($qglobals{$instid.'_tipt_status'} == 9) {
    $event = 3;
  }
  if ($entity_list->IsMobSpawnedByNpcTypeID(289045) or $entity_list->IsMobSpawnedByNpcTypeID(289046) or $entity_list->IsMobSpawnedByNpcTypeID(289047)) {
    quest::say('It appears that you have somehow found your way to me, but I sense that you are not yet ready to continue. Please, return when you have found that which is yet unfound.');
  } else {
    if ($text=~/hail/i) {
      if ($event == 0) { #Event ready, not started
        quest::say("So, another band of treasure-seekers desire to plunder the abomination that our fair temple has become. There was a time when those that wandered sought to do good in the fields they trampled, repair the trails they followed, and to help those in need they met along their way. Alas, these times are distant, dusty memories, and so now here I sit and judge. This [mountain] pass was once fertile and virtuous, can the same be said of you? Bah, true nobility is hidden in the heart. Today, your cunning and valor of mind shall be tested! Step forth, and hear my riddles. Plan to go no further than the grave if your mind and heart are weak!");
      } elsif ($event == 1) { #Event in progress
        quest::say("I am waiting for the answer...");
      } else { #event already completed
        quest::emote("ignores you.");
      }
    }
    if ($text=~/mountain/i) {
      quest::say("This mountain pass was once a holy place. It was a passage to a higher place as well as frame of mind. Everything here inspired the utmost respect of our people. Unfortunately, those days are gone and all that remains is broken or corrupted. I [test] all of those who wish to pass now.");
    }
    if ($text=~/test/i) {
      quest::say("'The test is . . . riddles! I have many of those. Take time to gather your wits about you and let me know when you are ready. Bear in mind that a wrong answer could lead to dire consequences. Tell me when you are [ready], and you shall have your riddle. The answer to any of my riddles can be found in the road behind you. Bring me an example of what you believe the answer to be, and you may pass freely.");
    }
    if (($text=~/ready/i) && ($event == 0)) {
      $event = 1;
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
}

sub EVENT_ITEM {
  if (($question == 1) && plugin::check_handin(\%itemcount,  54068 => 1)) { #Coffin
    $event = 2;
  }
  elsif (($question == 2) && plugin::check_handin(\%itemcount,  54069 => 1)) { #Right Hand
    $event = 2;
  }
  elsif (($question == 3) && plugin::check_handin(\%itemcount,  54070 => 1)) { #Gold
    $event = 2;
  }
  elsif (($question == 4) && plugin::check_handin(\%itemcount,  54071 => 1)) { #Fire
    $event = 2;
  }
  elsif (($question == 5) && plugin::check_handin(\%itemcount,  54072 => 1)) { #Candle
    $event = 2;
  }
  elsif (($question == 6) && plugin::check_handin(\%itemcount,  54073 => 1)) { #Catfish
    $event = 2;
  }
  elsif (($question == 7) && plugin::check_handin(\%itemcount,  54074 => 1)) { #Pearl
    $event = 2;
  }
  elsif (($question == 8) && plugin::check_handin(\%itemcount,  54075 => 1)) { #Rose
    $event = 2;
  }
  elsif (($question == 9) && plugin::check_handin(\%itemcount,  54076 => 1)) { #Glove
    $event = 2;
  }
  elsif (($question == 10) && plugin::check_handin(\%itemcount,  54077 => 1)) { #Cork
    $event = 2;
  }
  elsif (($question == 11) && plugin::check_handin(\%itemcount,  54078 => 1)) { #Sand
    $event = 2;
  }
  elsif (($question == 12) && plugin::check_handin(\%itemcount,  54079 => 1)) { #Wine
    $event = 2;
  }
  elsif (($question == 13) && plugin::check_handin(\%itemcount,  54080 => 1)) { #Feather
    $event = 2;
  }
  elsif (($question == 14) && plugin::check_handin(\%itemcount,  54081 => 1)) { #Firework
    $event = 2;
  }
  elsif (($question == 15) && plugin::check_handin(\%itemcount,  54082 => 1)) { #Bubble
    $event = 2;
  }
  else {
    quest::say("That is incorrect.");
    quest::spawn2(289040,0,0,-301,2093,634,342); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-302,2060,634,398); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-316,2040,648,478); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-334,2096,642,236); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-287,2079,634,364); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-258,2081,635,368); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-255,2065,634,374); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-251,2045,634,408); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-258,2091,634,368); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-261,2106,634,332); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-239,2069,634,382); #a_feeble_beludu_shade
    quest::spawn2(289040,0,0,-239,2087,634,376); #a_feeble_beludu_shade
  }
  if ($event == 2) {
    quest::say("You hear the grinding of stone as the door unlocks before you.");
    $entity_list->FindDoor(4)->SetLockPick(0);
    if (defined($qglobals{bic}) && ($qglobals{bic} == 11)) {
	  quest::say("'I sense you have come here seeking something besides passage. Please take this it was left here by one of your people's constructs.");
      quest::summonitem(67551); #Vaifan's Temporary Power Cell D
    }
    #update zone status
    if($instid == 0) {
      $instid = quest::GetInstanceID("tipt",0);
    }
    $instid = quest::GetInstanceID("tipt",0);
    quest::setglobal($instid.'_tipt_status',9,7,"H6");
  }
    plugin::return_items(\%itemcount);
    return;
}
