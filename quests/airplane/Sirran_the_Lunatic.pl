sub EVENT_SPAWN {
   quest::settimer("bye",1200);
}

sub EVENT_SAY {
  if($text=~/hail/i) { #island1
    if($sirran == 1) {
      quest::say("Ehem! What? Oh, hello there! Sirran be my name. Yes? So, come to the Plane of Sky, have you? Killed all my fairies! Hah! So! Do you wish to know how to traverse this plane? Or should I just go away? I know much about this plane. You would do well to listen!");
    }
    if($sirran == 2) { #island2
      quest::say("Ah! Come far you have! You are all crazy! I like it! Swords spin no more! Spin, spin. Unlucky they were! I thought them [vain]!");
    }
    if($sirran == 3) { #island3
      quest::say("What! Die already! Come so far. Can't you see I am cold! Give me a cloak or something! Bah! You don't look the type to give anything! Be off with you, then!");
      quest::say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
    }
    if($sirran == 4) { #island4
      quest::say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
    }
    if($sirran == 5) { #island5
      quest::say("Children, run to the wall and give the deputies some milk. Oh, I almost forgot. Give me your trinkets, or give me death!");
    }
    if($sirran == 7) { #island7
      quest::say("Nyah! The tears are welling up in my eyes! I am so proud. I think of you as if I were your father! Sniff. Sniff. Give me Veeshan, and I give you death");
    }
  }
  if($text=~/citanul eht narris, liah/i && $sirran == 6) { #island6
    quest::say("Lortap llaw taerg eht fo lahsram, Narris lahsram ma I. Flesym ecudortni ot em wolla. Sgniteerg");
  }
  if($text=~/llaw eht htiw eno I ma/i && $sirran == 6) { #island6
    quest::say("Kcul doog! Ouy rof ydaer si erips eht fo retsis eht won, sdik boj doog.");
	if(!$entity_list->IsMobSpawnedByNpcTypeID(71076)) {
      quest::spawn2(71076,0,0,-929,-1035,1093,64); #used Magelo to get the closest loc as possible.
	}
  }
  if($text=~/traverse this plane/i && $sirran == 1) {
    quest::say("Ahah! Wise you are and tell you I will. Hrm? Don't have wings, do you? Fairies have swords! Fairies stole my lucky feet! Hand me them, one by one, and be in for a treat! Haha!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20920 => 1)) { #A Miniature Sword
    quest::say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
    quest::summonitem(20911); # Key of Swords
  }
  elsif(plugin::check_handin(\%itemcount, 20921 => 1)) { #Lost Rabbit's Foot
    quest::say("These are the keys! Use them well! Hold them in your hand and touch them to the runed platforms! Guide you thy will! Hah! The last to go, must tell me so, or be in for a [hassle]! If there's a hassle, I will go!");
    quest::summonitem(20912); # Key of the Misplaced
  }
  elsif(plugin::check_handin(\%itemcount, 20922 => 1)) { #Broken Mirror
    quest::say("You move fast, you crazy kids! Keep going! Prod you I will! Stuck here I have been! Oh! Let me know when you are [done] or this will be no fun! Haha");
    quest::summonitem(20913); # Key of Misfortune
  }
  elsif(plugin::check_handin(\%itemcount, 20923 => 1)) { #Animal Figurine
    quest::say("Always want something for nothing? Oh yes, you gave me something! Here you go! Take this! Used one you have. [Teleport] away you will! Let me know, or no kill! Haha!");
    quest::summonitem(20914); #Key of Beasts
  }
  elsif(plugin::check_handin(\%itemcount, 20924 => 1)) { #Bird Whistle
    quest::say("What is this? Bah! Take that! And this! What was I thinking? I was thinking you had best let me know when you use those teleporters. Just say, [Icky Bicky Barket]. Aye, that is what I was thinking.");
    quest::summonitem(20915); #Avian Key
  }
  elsif(plugin::check_handin(\%itemcount, 20925 => 1)) { #Noise Maker
    quest::say("Phew! These are heavy. Well, not really. I'm sure I don't have to remind you to remind me when you are [leaving].");
    quest::summonitem(20916); #Key of the Swarm
  }
  elsif(plugin::check_handin(\%itemcount, 20926 => 1)) { #Dull Dragon Scale
    quest::say("Dnib a ni era uoy ro esarhp eht yas dna yrruh!! Sruoy era syek eht dna romra em evig. Erom on gnits seixib eht ahahahahah!");
    quest::summonitem(20917); #Key of Scale
  }
  elsif(plugin::check_handin(\%itemcount, 20927 => 1)) { #Replica of the Wyrm Queen
    quest::say("Not too much farther. I spit on thee knave! Ehem. Take these. Go on! Make your fortunes. No one cares about Narris. I mean Sirran. Hah! See if I care what you think! Oh, when did you say you were [leaving]?");
    quest::summonitem(20918); #Veeshan's Key (not the one purchased on island #1 which is 20919)
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_AGGRO {
  quest::shout("What?! Now you've done it! The bunnies are angry! ANGRY I TELL YOU!");
}

sub EVENT_TIMER {
  if($timer eq "bye") {
    quest::stoptimer("bye");
    quest::depop();
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::delglobal("sirran");
}
