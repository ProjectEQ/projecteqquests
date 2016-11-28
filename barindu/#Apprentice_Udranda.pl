sub EVENT_SAY {
  $InInstanceVxed = quest::GetInstanceID("vxed",0);
  $InInstanceTipt = quest::GetInstanceID("tipt",0);
  $group = $client->GetGroup();
  
  if ($text=~/hail/i) { 
	if(plugin::check_hasitem($client, 69933)) {
	 $vxedPally = quest::GetInstanceID("vxed",1);
	 $raid = $client->GetRaid();
	 
	  #quest::say("instanceid $vxedPally");
	  quest::say("I heard you released Reiya from his tourture, $name. I have seen muramites gathering in Vxed and I fear this may have to do with Reiya and the creatures responsible. Go there now and investigate, Noble Knight.");
	   if ($raid) {
		if ($raid->RaidCount() <= 24 && $raid->RaidCount() >= 6) {
			  if ($vxedPally == 0) {
				$Instance = quest::CreateInstance("vxed", 1, 7200);
				quest::AssignRaidToInstance($Instance);   
				quest::say("Instance added.");
				quest::emote("subtly commands her stone worker to open the passage for you before any invaders can take notice.");
			  }
			  else {
				$client->Message(13, "You are already in an instance!");
			  }	  
		 } else {
		 } 
       }
      else {
       $client->Message(13, "You are not in a raid!");
      }
	}
	else {
      quest::say("Greetings. I have a duty here to stand guard at the mountain pass and allow the Muramites to pass through by moving the rocks with my magic. 'Udranda looks around for anyone listening and whispers to you' If you want to go into [" . quest::saylink("Tipt") . "] or [" . quest::saylink("Vxed") . "] I will have my stone worker open the passage for you. If you want to progress past the mountains, I would ask that you first prove your worth with High Priest Diru.");
	 quest::setglobal("god_vxed_access",1,5,"F"); 
	}
  }
  if ($text=~/vxed/i) {
    if ($group || $status > 79) {
      if (defined($qglobals{god_vxed_access}) && ($qglobals{god_vxed_access} == 1)) {
        quest::say("Your work in the sewers has been vital to our progression, please proceed with caution in the mountain pass. Find the Stonespiritist for further advancement.");
        if ($InInstanceVxed == 0 && $InInstanceTipt == 0) {
          $Instance = quest::CreateInstance("vxed", 0, 21600);
          if($group) {
            quest::AssignGroupToInstance($Instance);
            quest::say("Instance added.");
          } elsif ($status >79){
            quest::AssignToInstance($Instance);
            quest::say("Instance added.");
          }
        } else {
          $client->Message(13, "You are already in an instance!");
        }
      }
    } else {
      $client->Message(13, "You are not in a group!");
    }
  }
  if ($text=~/tipt/i) {
    if ($group || $status > 79) {
      if (defined($qglobals{god_tipt_access}) && ($qglobals{god_tipt_access} == 1)) {
        quest::say("Proceed with caution, you must face several trials to find your way through this pass.");
        if($InInstanceVxed == 0 && $InInstanceTipt == 0) {
          $Instance = quest::CreateInstance("tipt", 0, 21600);
          if($group) {
            quest::AssignGroupToInstance($Instance);
			#create zone global
            quest::targlobal($Instance.'_tipt',0,"H6",0,0,0);
            quest::say("Instance added.");
          } elsif($status >79) {
            quest::AssignToInstance($Instance);
			#create zone global
            quest::targlobal($Instance.'_tipt',0,"H6",0,0,0);
            quest::say("Instance added.");
          }
        } else {
          $client->Message(13, "You are already in an instance!");
        }
      }
    } else {
      $client->Message(13, "You are not in a group!");
    }
  }
}