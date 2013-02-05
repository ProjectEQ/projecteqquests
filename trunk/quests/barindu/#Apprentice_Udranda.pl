sub EVENT_SAY {
  $InInstanceVxed = quest::GetInstanceID("vxed",0);
  $InInstanceTipt = quest::GetInstanceID("tipt",0);
  $group = $client->GetGroup();

  if ($text=~/hail/i) {
      quest::say("Do you wish to enter [vxed] or are you ready for [tipt]?");
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