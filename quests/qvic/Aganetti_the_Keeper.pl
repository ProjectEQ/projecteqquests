sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("gestures to the end of the cavernous hallway.");
    quest::say("Beyond that corner lies the entrance to the forgotten chapel of Inktu'ta. The force of the blast from the portal's implosion tore a hole in the mountain, revealing the way to this place. Some things should remain unknown. Inktu'ta should have stayed buried forever. Believe me $name only a fool would disturb the halls of this cursed chapel. Will you [heed my warning] or do you wish to [" . quest::saylink("continue") . "]...?");
  } elsif ($text=~/continue/i) {
    #if cynosure is up do not proceed
    if(!$entity_list->GetMobByNpcTypeID(295140) && !$entity_list->GetMobByNpcTypeID(295149)) {
      quest::say("Very well! If you will not heed my warning, then you have chosen to suffer the consequences. I grant you entrance to Inktu'ta.");
      #allow a GM to request the instance and if in a raid bring the entire raid with him
      $raid = $client->GetRaid();
      #if($raid || $status > 79) { #change to this when when zone goes live.
      if($status > 99) { #temporary to allow GM to bring in a raid for testing.
        if(!defined($qglobals{inktutalockout})) {
          $InInstance = quest::GetInstanceID("inktuta",0);
          if($InInstance == 0){
            $NewInstance = quest::CreateInstance("inktuta", 0, 21600);
            if($raid) {
              quest::AssignRaidToInstance($NewInstance);
              #create status global
              quest::targlobal($NewInstance.'_inktuta',0,"H6",0,0,296);
              quest::say("Instance added.");
            } elsif($status >79) {
              quest::AssignToInstance($NewInstance);
              #create status global
              quest::targlobal($NewInstance.'_inktuta',0,"H6",0,0,296);
              quest::say("Instance added.");
            }
          } else {
            $client->Message(13, "You are already in an instance!");
          }
        } else {
          $client->Message(13,"You have recently completed a raid.");
        }
      } else {
        $client->Message(13, "You are not in a raid!");
      }
    } else {
      #need live text for when cynosure is up.
      quest::say("The power of the Muramites is blocking the entrance to the temple.");
    }
  }
}