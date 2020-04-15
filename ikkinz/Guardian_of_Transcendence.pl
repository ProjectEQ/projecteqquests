sub EVENT_SPAWN {
  if($x == -15 && $y == 0) {
    quest::setnexthpevent(90);
  }
  if($x == 445 && $y == -489) {
	$npc->SetHP(473300);
	quest::setnexthpevent(75);
  }
  if($x == 671 && $y == -714) {
	$npc->SetHP(394420);
	quest::setnexthpevent(50);
  }
  if($x == 534 & $y == -210) {
    $npc->SetHP(262947);
  }
}

sub EVENT_HP {
  if($hpevent == 90) {
    quest::ze(0,"Guardian of Transcendence crumbles to dust upon the ground, but you have the feeling that you haven't seen the last of it yet.");
    quest::depop();
    quest::spawn2(294500,0,0,445,-489,-45,418); # NPC: Guardian_of_Transcendence
    $entity_list->FindDoor(15)->SetLockPick(0);
    $entity_list->FindDoor(16)->SetLockPick(0);
  }
  if($hpevent == 75) {
	quest::ze(0,"Guardian of Transcendence crumbled once again into a pile of dust. Like before, you feel like you haven't seen the last of it.");
    quest::depop();
    quest::spawn2(294500,0,0,671,-714,-50,382); # NPC: Guardian_of_Transcendence
    $entity_list->FindDoor(8)->SetLockPick(0);
    $entity_list->FindDoor(9)->SetLockPick(0);	
  }
  if($hpevent == 50) {
    quest::ze(0,"Guardian of Transcendence crumbles once more to dust at your feet. Its presence remains, though. It is no doubt waiting for you.");
    quest::depop();
    quest::spawn2(294500,0,0,534,-210,-50,144); # NPC: Guardian_of_Transcendence
    $entity_list->FindDoor(10)->SetLockPick(0);
    $entity_list->FindDoor(12)->SetLockPick(0);
	$entity_list->FindDoor(13)->SetLockPick(0);
	$entity_list->FindDoor(14)->SetLockPick(0);
  }
}  

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294593,0,0,530,-261,-50,138); # NPC: Vrex_Xalkak`s_Sentinel
  quest::spawn2(294598,0,0,531,-157,-50,252); # NPC: #Vrex_Xalkak`s_Sentinel
  quest::spawn2(294599,0,0,522,-233,-50,136); # NPC: #Vrex_Xalkak`s_Sentinel_
  quest::spawn2(294600,0,0,516,-182,-50,136); # NPC: Vrex_Xalkak`s_Sentinel_
  quest::signalwith(294631,5); #set lockout
  quest::ze(0,"The death of the Guardian of Transcendence reveals a trusik geomancer! It appears he was the guardian all along and used his phenomenal abilities to lure you into his den!");
  quest::ze(0,"Vrex Xalkak Nixki says, 'I won't be defeated so easily! Come forth, my sentinels! Your time to work is at hand!'");
}
