sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings! Allow me to introduce myself. I am Marshal Ghobber Truppack, Marshal of the Great Wall Patrol. Are you [new to the squad]?");
  }
  if (($text=~/new to the squad/i) {
    if ($faction <= 5) {
	  quest::say("Great!!! We required more deputies in this squad. We are suffering great losses to the [new threat]. Welcome to the Great Wall Patrol where our motto is, 'United we shall defend.' It will be some time before you can earn your squad ring - first you must prove your strength in battle. Report to the squad leader. He is Deputy Budo. You can find him at the Great Wall of Serilis in the Misty Thicket. Go to him at once and tell him you are reporting for duty.");
	}
  }
  if($text=~/new threat/i) {
    if ($faction <= 5) {
	  quest::say("The new threat I refer to is the community of goblins which was found beyond the Great Wall of Serilis. They are called Clan Runnyeye. They have begun to sneak over the wall. The deputies have reported seeing them launch themselves up the wall in a matter of seconds using ornate grappling hooks. We have attempted to obtain of these devices for further inspection, but we have yet to find one of any of the dead goblins. If you should ever find one, be sure to bring it to me immediately.");
	}
  }
  if(($text=~/new to the squad/i) || ($text=~/new threat/i)) {
    if ($faction => 6) {
	  quest::say("'How can you expect to just waltz into Guardian Stronghold and expect to gather information?! Consider yourself lucky I don't command the Guardian of the Vale deputies to show you the sharpness of their blades!");
	}
  }
  if ($text=~/one with the wall/i) {
    if ($faction == 1){
      quest::say("Yes!! Welcome, Deputy $name! You are now an elite member of the Great Wall Division. Wear this ring with pride. You may take it to Hendi Mrubble of the Clerics of Mischief for healing at any time. Wear it with pride.");
      quest::summonitem(13936);
	  quest::faction(133, -399); #Guardian of the Vale
      #quest::enabletitle(1);
    }
    else {
      quest::say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9475 => 1)) {#rogue 1.5 handin
    quest::say("Ah, thank you. I was a bit parched.' Mayor Gubbin unstops the flask and takes a healthy swig of the brew. He makes a strange face and licks his lips while staring at the bottle. 'Wow, this is delicious. Like no other drink I've ever tried. This is even better than that Spiced Jumjum that Lanena is so fond of. Wait a moment . . . Is this the brew that Deeppockets keeps trying to hawk in my town? Well now, I suppose it's not so bad. Hmm. Why don't you tell him I've changed my mind. Tell Lendel he has my blessing and is welcome to bring in as much of this as he can sell.");
    quest::summonitem(13588);
  }
  plugin::return_items(\%itemcount);
}


#END of FILE Zone:rivervale  ID:19104 -- Mayor_Gubbin 

