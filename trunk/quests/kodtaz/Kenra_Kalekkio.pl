sub EVENT_SAY {
 $InInstanceIkky1 = quest::GetInstanceID("ikkinz",0);
 $InInstanceIkky2 = quest::GetInstanceID("ikkinz",1);
 $InInstanceIkky3 = quest::GetInstanceID("ikkinz",2);
 $group = $client->GetGroup();

  if($text=~/hail/i) {
    if(defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1) {
      quest::say("Feel free to venture in this trial again");
    }
    elsif(defined $qglobals{ikky} && $qglobals{ikky} == 3) {
      quest::say("I have been expecting you, $name. You proven your worth thus far by completing the first two trials and for that I applaud you. You are not through with your testing though. You have a [" . quest::saylink("final test") . "] to complete here at the Temple of the Tri-Fates before you will be considered ready for further work.");
    }
    else {
      quest::say("Oh dear, you startled me! I hate to be rude, but you must understand that I'm on very important business here and I don't have time to chat with you now. You still need to find Gazak Klelkek and complete the first trial anyway, so why don't you get on your way? Good luck!");
    }
  }
  if($text=~/final test/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 3) {
      quest::say("Very well. Time is critical, $name. Your final test takes you within the Temple of the Tri-Fates. We call it this because of the three creatures you will encounter once inside. The [" . quest::saylink("three beasts") . "] are hunters that have deadly accuracy with a bow and attack together to make a dangerous combination.");
    }
  }
  if($text=~/three beasts/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 3) {
      quest::say("The three hunters inside the temple are called the Tri-Fates. They are named thusty because of their ability to control your fate on a whim. Their victims' usual fate is that of death, though I believe the Wayfarers Brotherhood has recruits that can stand up to them. Perhaps you are that person? Perhaps you have the desire to [" . quest::saylink("prove myself",0,"prove yourself"). "] worthy, venture into the temple, and slay the beasts?");
    }
  }
  if($text=~/prove/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 3) {
      quest::say("Good to hear, but before you go there is more you must know. These hunters are guarding some relics that are giving them extremely high accuracy with their weapons. If they are allowed to possess these relics any longer, they may become an unstoppable force. You must [" . quest::saylink("recover the relics") . "] so the Wayfarers Brotherhood can examine them.");
    }
  }
  if($text=~/recover the relic/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 3) {
      quest::say("This is your final trial and will prove, once and for all, if you are capable of taking on the more serious issues concerning the Muramites. You must fight through the temple and enter an entrance to the inner chambers of the Temple of the Tri-Fates. Once inside, kill the Tri-Fates and return the relics. When you are [" . quest::saylink("ready to begin") . "] and have a group with you, return to me, and I shall send you on your way.");
    }
  } 
  if ($text=~/ready/i) {
    if($group){
      if(!defined $qglobals{lockout_ikky_g3}) {
	    if((defined $qglobals{ikky} && $qglobals{ikky} == 3) || (defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1)) {
          quest::say("Then I bid you good luck on your journeys, $name. Make haste into the temple and, hopefully, by the time we meet again you'll have recovered the relics and passed the final test.");
          if($InInstanceIkky3 == 0){
		    $Instance = quest::CreateInstance("ikkinz", 2, 10800);
		    quest::AssignGroupToInstance($Instance);	
		    quest::say("Instance added.");
          } 
          else {
		    $client->Message(13, "You are already in an instance!");
	      }
        }
        else {
          quest::say("You need to speak with Kevren!"); 
        }
      }
	  else {
	    quest::say("You have recently completed this trial, please come back at a later point");
	  }
    }  
    else {
	  $client->Message(13, "You are not in a group!");
    }
  }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 60154 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 3)) {
    quest::say("I am astounded that you have completed the trial so easily! You have gone above and beyond our expectations and are ready to continue beyond mere trials! Congratulations, $name! At this time, you should return to Kevren so he can guide you on your way from here on out.");
    quest::setglobal("ikky",4,5,"F");
    $client->Message(4,"Finished!- You have completed the trial at the Temple of the Tri-Fates!");
  }
  elsif (plugin::check_handin(\%itemcount,60154 =>1 )) {
    quest::say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
    quest::summonitem(60154);
  }
  plugin::return_items(\%itemcount);
}
