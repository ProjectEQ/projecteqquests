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
    quest::depop();
    quest::spawn2(294500,0,0,445,-489,-45,209);
    $entity_list->FindDoor(15)->SetLockPick(0);
    $entity_list->FindDoor(16)->SetLockPick(0);
  }
  if($hpevent == 75) {
    quest::depop();
    quest::spawn2(294500,0,0,671,-714,-50,191);
    $entity_list->FindDoor(8)->SetLockPick(0);
    $entity_list->FindDoor(9)->SetLockPick(0);
  }
  if($hpevent == 50) {
    quest::depop();
    quest::spawn2(294500,0,0,534,-210,-50,72);
    $entity_list->FindDoor(10)->SetLockPick(0);
    $entity_list->FindDoor(12)->SetLockPick(0);
	$entity_list->FindDoor(13)->SetLockPick(0);
	$entity_list->FindDoor(14)->SetLockPick(0);
  }
}  

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294593,0,0,530,-261,-50,69);
  quest::spawn2(294598,0,0,531,-157,-50,126); 
  quest::spawn2(294599,0,0,522,-233,-50,68);
  quest::spawn2(294600,0,0,516,-182,-50,68);
  $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
      }
  foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkylockout5", 1, "H6", 293115, $charid, 293);
  }
}
