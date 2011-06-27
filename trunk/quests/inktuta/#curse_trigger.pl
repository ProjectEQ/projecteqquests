sub EVENT_SPAWN {
  quest::settimer(1,60);  #adjust timer based on difficulty, no info on duration
  quest::settimer(2,15);  #timer for event completion check
}

sub EVENT_TIMER {
  if($timer == 2) {
    #check to see if any of the six cursecallers are up
    $check_fhq = $entity_list->GetMobByNpcTypeID(296053);
    $check_kia = $entity_list->GetMobByNpcTypeID(296054);
    $check_qib = $entity_list->GetMobByNpcTypeID(296055);
    $check_req = $entity_list->GetMobByNpcTypeID(296056);
    $check_tow = $entity_list->GetMobByNpcTypeID(296057);
    $check_xav = $entity_list->GetMobByNpcTypeID(296058);
    #no cursecallers up then spawn true and mirror images of noq in next room
    if (($check_fhq == 0) && ($check_kia == 0) && ($check_qib == 0) && ($check_req == 0) && ($check_tow == 0) && ($check_xav == 0)) {
      quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
      $entity_list->FindDoor(42)->SetLockPick(0);
      $entity_list->FindDoor(43)->SetLockPick(0);
      quest::spawn2(296065,0,0,-55,-653,-127,121);
      quest::spawn2(296066,0,0,-103,-652,-127,125);
      quest::stoptimer(1);
      quest::stoptimer(2);
      $npc->Depop(1);
    }
  } elsif($timer == 1) {
    #random cursebearer
    quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-166,-911,-127,194);
  }
}