sub EVENT_SAY {
 $InInstanceIkky1 = quest::GetInstanceID("ikkinz",0);
 $InInstanceIkky2 = quest::GetInstanceID("ikkinz",1);
 $InInstanceIkky3 = quest::GetInstanceID("ikkinz",2);
 $group = $client->GetGroup();

if($text=~/hail/i) {
    if(defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1) {
       quest::say("Feel free to venture in this trial again");
    }
    elsif(defined $qglobals{ikky} && $qgloblas{ikky} == 3) {
      quest::say("You are doing well are you [ready] to face the challenge of the tri fates?");
    }
    else {
      quest::say("Oh dear, you startled me! I hate to be rude, but you must understand that I'm on very important business here and I don't have time to chat with you now. You still need to find Gazak Klelkek and complete the first trial anyway, so why don't you get on your way? Good luck!");
      }
   }   
  if ($text=~/ready/i) {
      if($group){
	if((defined $qglobals{ikky} && $qglobals{ikky} == 3) || (defined $qglobals{ikkyredo} && $qglobals{ikkyredo} == 1)) {
           quest::say("Very well then, $name. Good luck on your journey through the temple and may you prove to the brotherhood that you are more than meets the eye. The temple awaits...");
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
             quest::say("You need to speak with Kevren.");
             }
        }
        else {     
	 $client->Message(13, "You are not in a group!");
         }
   }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 60154 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 3)) {
  quest::setglobal("ikky",4,5,"F");
  quest::setglobal("ikkyredo",1,5,"F");
  $client->Message(4,"Finished!- You have completed the trial at the Temple of Twin Struggles!");
  $client->Message(4,"Finished! - You can now retry any of the trials at any time!");
}
elsif (plugin::check_handin(\%itemcount,60154 =>1 )) {
  quest::say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
  quest::summonitem(60154);
  }
  plugin::return_items(\%itemcount);
}
