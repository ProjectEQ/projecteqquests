sub EVENT_SPAWN {
  quest::settimer(1,15);  #timer for event completion check
}

sub EVENT_AGGRO {
  my $instid = quest::GetInstanceID("inktuta",0);
  if($instid > 0) {
    quest::setglobal($instid.'_inktuta_status',9,3,"H6");
    $npc->Depop(0);
    quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
    $entity_list->FindDoor(42)->SetLockPick(0);
    $entity_list->FindDoor(43)->SetLockPick(0);
    quest::spawn2(296065,0,0,-55,-653,-127,121);
    quest::spawn2(296066,0,0,-103,-652,-127,125);
    quest::stoptimer(1);
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    #check to see if any of the six cursecallers are up
    if (!$entity_list->GetMobByNpcTypeID(296053) && !$entity_list->GetMobByNpcTypeID(296054) && !$entity_list->GetMobByNpcTypeID(296055) && !$entity_list->GetMobByNpcTypeID(296056) && !$entity_list->GetMobByNpcTypeID(296057) && !$entity_list->GetMobByNpcTypeID(296058)) {
	  #pick any client and "aggro" them so we can get the instance id
      my $rClient = $entity_list->GetRandomClient($x,$y,$z, 1500);
      if ($rClient) {
        quest::attack($rClient->GetName());
      }
    }
  }
}