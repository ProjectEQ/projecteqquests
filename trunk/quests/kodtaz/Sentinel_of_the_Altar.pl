sub EVENT_ITEM {
  $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
if ((plugin::check_handin(\%itemcount, 60173 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 14)) {
   if($raid){
     if(!defined $qglobals{ikkylockout6}) {
	if(defined $qglobals{ikky} && $qglobals{ikky} == 14) { 
           if($InInstanceIkky7 == 0){
		 $Instance = quest::CreateInstance("ikkinz", 6, 21600);
		 quest::AssignRaidToInstance($Instance);	
		 quest::say("Instance added.");
                 quest::summonitem(60173);
             } else {
		$client->Message(13, "You are already in an instance!");
	 	  }
           }
         } else {
           $client->Message(13,"You have recently completed a raid.");
           }
      } else {
	 $client->Message(13, "You are not in a raid!");
         }
   }
   plugin::return_items(\%itemcount);
}   
