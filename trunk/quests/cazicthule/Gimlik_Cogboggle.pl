my $EventStage;

sub EVENT_SPAWN {
  $EventStage = 0;
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, noble soul! I'm Gimlik Cogboggle. You are correct, the Gimlik Cogboggle, renowned adventurer, scholar, and yes... creator of spells. Please don't goggle or touch. Your opportunity has arrived, my friend. I was sent here to complete a very important task and for that, I will need some slight assistance. If you will be kind enough to follow me, I'll show you to your doom... err... get this show on the road. Just let me know when you're ready.");
  }
  if($text=~/ready/i) {
    quest::say("Well look at you! You see, you're off to a great start! Now, just follow me and yell out if something stabs you or maims you in anyway. Never fear, I've memorized gate and have complete confidence in your ability to fend off danger for at least five seconds. Follow me... follow me.");
    #quest::start(0);
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8723 => 1) && ($EventStage == 2)) { #Tiny Metal Quill
    quest::say("");
    quest::summonitem(0);
    quest::givecash(8,4,3,12); #Copper x 8, Silver x 4, Gold x 3, Platinum x 12
    quest::depop();
  }
  else {
    quest::say("I do not want this.");
    quest::return_items(\%itemcount);
  }
}

sub EVENT_WAYPOINT_DEPART {
  if(($wp == 1) && ($EventStage == 1)) { #Home point
    quest::say("Thank you for your assistance. If you found anything of importance during our adventure, I will gladly give you something in trade...");
    quest::stop();
    $EventStage = 2;
  }
  if(($wp == 2) && ($EventStage == 0)) { #Ambush point 1
    quest::say("");
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
  }
  if(($wp == 3) && ($EventStage == 0)) { #Ambush point 2
    quest::say("");
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
  }
  if(($wp == 4) && ($EventStage == 0)) { #Ambush point 3
    quest::say("");
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
  }
  if(($wp == 5) && ($EventStage == 0)) { #Ambush point 4
    quest::say("");
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
  }
  if(($wp == 6) && ($EventStage == 0)) { #Ambush point 5
    quest::say("");
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
  }
  if(($wp == 7) && ($EventStage == 0)) { #Ambush point 6
    quest::say("");
    $EventStage = 1;
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    #quest::spawn2();
    quest::settimer("SpawnNamed",60);
  }
}

sub EVENT_TIMER {
  quest::stoptimer("SpawnNamed");
  #quest::spawn2(48209,0,0,$x,$y,$z,$h); #a Thul Tae Ew Tracker
}

sub EVENT_SIGNAL {
  quest::stop();
  #quest::start(1);
}