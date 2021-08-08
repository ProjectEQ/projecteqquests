# items: 60173
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60173 =>1)) {
    quest::emote("motions for you to enter the altar through the entrance behind him.");
    if(defined($qglobals{ikky}) && ($qglobals{ikky} == 14)) {
      $raid = $client->GetRaid();
      if($raid){
		  if ($raid->RaidCount() <= 54) {
			if(!defined($qglobals{ikkylockout6})) {
			  $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
			  if($InInstanceIkky7 == 0){
				$Instance = quest::CreateInstance("ikkinz", 6, 21600);
				quest::AssignRaidToInstance($Instance);	
				quest::say("Instance added.");
				$client->MarkCompassLoc(1860, 660, -447);
			  } else {
				$client->Message(13, "You are already in an instance!");
			  }
			} else {
			  $client->Message(13,"You have recently completed a raid.");
			}
		  } else {
			$client->Message(13, "You have ".$raid->RaidCount()." players in raid.  Only 54 allowed");
		  } 
      } else {
        $client->Message(13, "You are not in a raid!");
      }
    }
    quest::summonitem(60173); # Item: Icon of the Altar
  }
  plugin::return_items(\%itemcount);
}   
