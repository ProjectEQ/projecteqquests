sub EVENT_SPAWN {
    quest::settimer(1,60);   #adjust timer based on difficulty, no info on duration
}

sub EVENT_TIMER {
#check to see if any of the six cursecallers are up
    $check_fhq = $entity_list->GetMobByNpcTypeID(292053);
    $check_kia = $entity_list->GetMobByNpcTypeID(292054);
    $check_qib = $entity_list->GetMobByNpcTypeID(292055);
    $check_req = $entity_list->GetMobByNpcTypeID(292056);
    $check_tow = $entity_list->GetMobByNpcTypeID(292057);
    $check_xav = $entity_list->GetMobByNpcTypeID(292058);
#no cursecallers up then spawn true and mirror images of noq in next room
  if (($check_fhq == 0) && ($check_kia == 0) && ($check_qib == 0) && ($check_req == 0) && ($check_tow == 0) && ($check_xav == 0)) {
    quest::depop();
    quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
    quest::setglobal("inktdoor3",1,3,"H6");
    quest::spawn2(296065,0,0,-55,-653,-127,121);
    quest::spawn2(296066,0,0,-103,-652,-127,125);
  }
  else {
#random cursebearer
    quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-166,-911,-127,194);
    }
}