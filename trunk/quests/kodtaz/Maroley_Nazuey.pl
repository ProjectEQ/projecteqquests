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
      quest::say("You are doing well are you [ready] to face the challenge of the twin struggles?");
    }
    elsif(defined $qglobals{ikky} && $qglobals{ikky} >= 3) {
      quest::say("You have finished this trial, speak with Kevren and proceed to the next one.");
    }
    else {
      quest::say("Gah, what do you think you're doing causing all that ruckus? I'm trying to keep a low profile so no wandering Muramites come to investigate noise. I may be the liaison for this temple, but that doesn't mean you can blow my cover! In any case, you still need to find Gazak and attempt the first trial before you can go any farther! Now make haste!");
      }
   }   
  if ($text=~/ready/i) {
     if($group){
	if((defined $qglobals{ikky} && $qglobals{ikky} == 2) || (defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1)) {			
           quest::say("Very well then, $name. Good luck on your journey through the temple and may you prove to the brotherhood that you are more than meets the eye. The temple awaits...");
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
             quest::say("You need to speak with Kevren.");
             }
        }
        else {     
	 $client->Message(13, "You are not in a group!");
         }
   }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 60153 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 2)) {
  quest::setglobal("ikky",3,5,"F");
  $client->Message(4,"Finished!- You have completed the trial at the Temple of Twin Struggles!");
}
elsif (plugin::check_handin(\%itemcount,60153 =>1 )) {
  quest::say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
  quest::summonitem(60153);
  }
  plugin::return_items(\%itemcount);
}
