sub EVENT_SAY {
 $InInstanceIkky1 = quest::GetInstanceID("ikkinz",0);
 $InInstanceIkky2 = quest::GetInstanceID("ikkinz",1);
 $InInstanceIkky3 = quest::GetInstanceID("ikkinz",2);
 $group = $client->GetGroup();

  if($text=~/hail/i) {
    if(defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1) {
      quest::say("Feel free to venture in this trial again");
    }
    elsif(defined $qglobals{ikky} && $qglobals{ikky} == 2) {
      quest::say("At last you have arrived. I have heard that you passed the trial at the Temple of Singular Might without any problems and I congratulate you on your achievement. Do not believe for a moment that you are done! Your next trial will be more difficult that the last. Are you ready to hear [what's in store] for you beyond the temple exterior?");
    }
    elsif(defined $qglobals{ikky} && $qglobals{ikky} >= 3) {
      quest::say("You have finished this trial, speak with Kevren and proceed to the next one.");
    }
    else {
      quest::say("Gah, what do you think you're doing causing all that ruckus? I'm trying to keep a low profile so no wandering Muramites come to investigate noise. I may be the liaison for this temple, but that doesn't mean you can blow my cover! In any case, you still need to find Gazak and attempt the first trial before you can go any farther! Now make haste!");
    }
  }
  if($text=~/in store/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 2) {
      quest::emote("glaces toward the temple. 'The Muramites have sent priests to this temple. These priests are not ordinary, in fact they are terrible, horrific beings sent to collect artifacts for a singular purpose. What this purpose is we are not clear on, but we believe it has something to do with a summoning of some sort. If you're willing to [test your mettle] in this trial, now is the time for action.'");
    }   
  }
  if($text=~/test your mettle/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 2) {
      quest::say("The rumor we have been investigating suggests that the summoning will be a beast of war that is far more destructive than anything we may have seen so far. The Muramite [priests] working inside this temple are gathering artifacts of corporeal power that will grant the beast an unusual physical strength when it is conjured. We must make sure that they do not finish this summoning.");
    }   
  }
  if($text=~/priest/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 2) {
      quest::say("I nearly forgot. You must venture inside to an entrance to the inner chambers of the Temple of Twin Struggles and enter there. Once inside you must find the Malevolent Priests. We have begun referring to them thusty because of their torturous looks and ways. They are very unpleasant and work cooperatively. You must get to them and [recover the artifacts] they have been gathering before they are allowed to move them to another temple nearby.");
    }   
  }
  if($text=~/recover the artifacts/i) {
    if(defined $qglobals{ikky} && $qglobals{ikky} == 2) {
      quest::say("This is your moment, $name. Now is the time to prove your worth to the brotherhood. I bid you good luck and hope that the strength you showed in the first trial will aid you again in your second one. When you are [ready to enter the temple] and have a group with you, return to me and I shall set you on your way.");
    }   
  }
  if ($text=~/ready/i) {
    if($group){
      if(!defined $qglobals{ikkylockout1}) {
	    if((defined $qglobals{ikky} && $qglobals{ikky} == 2) || (defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1)) {			
          quest::say("Very well then, $name. Perhaps I will see you again soon and, by that time, I hope you have the artifact in your possession.");
          if($InInstanceIkky2 == 0){
		    $Instance = quest::CreateInstance("ikkinz", 1, 10800);
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
  if ((plugin::check_handin(\%itemcount, 60153 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 2)) {
    quest::say("You've done well, $name. I believed this temple was more than you could handle despite your success with the first temple. You faced two enemies at once and came back  in one piece. You only have one more trial left to complete before you can proceed onto more difficult tasks. Please return to Kevren for information on the final trial. Good luck!");
    quest::setglobal("ikky",3,5,"F");
    $client->Message(4,"Finished!- You have completed the trial at the Temple of Twin Struggles!");
  }
  elsif (plugin::check_handin(\%itemcount,60153 =>1 )) {
    quest::say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
    quest::summonitem(60153);
  }
  plugin::return_items(\%itemcount);
}
