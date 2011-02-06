sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60173 =>1)) {
    if(defined($qglobals{ikky}) && ($qglobals{ikky} == 14)) {
      $raid = $client->GetRaid();
      if($raid){
        if(!defined($qglobals{ikkylockout6})) {
          $InInstanceIkky7 = quest::GetInstanceID("ikkinz",6);
          if($InInstanceIkky7 == 0){
            $Instance = quest::CreateInstance("ikkinz", 6, 21600);
            quest::AssignRaidToInstance($Instance);	
            quest::say("Instance added.");
          } else {
            $client->Message(13, "You are already in an instance!");
          }
        } else {
          $client->Message(13,"You have recently completed a raid.");
        }
      } else {
        $client->Message(13, "You are not in a raid!");
      }
    }
    quest::summonitem(60173);
  }
  plugin::return_items(\%itemcount);
}   
