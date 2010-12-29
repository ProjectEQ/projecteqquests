sub EVENT_SPAWN {
  quest::setnexthpevent(90);
}

sub EVENT_HP {
  if($hpevent == 90) {
     $npc->GMMove(445,-489,-45,209);
     quest::setnexthpevent(75);
$group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
       }
      }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkydoor", 1, "H6", 294500, $charid, 294);
        }
     
  }
  if($hpevent == 75) {
     $npc->GMMove(671,-714,-50,191);
     quest::setnexthpevent(50);
$group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
       }
      }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkydoor", 2, "H6", 294500, $charid, 294);
        }
   }
   if($hpevent == 50) {
      $npc->GMMove(534,-210,-50,72);
$group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
       }
      }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkydoor", 3, "H6", 294500, $charid, 294);
        }
   }
}  

sub EVENT_DEATH {
  quest::spawn2(294593,0,0,530,-261,-50,69);
  quest::spawn2(294598,0,0,531,-157,-50,126); 
  quest::spawn2(294599,0,0,522,-233,-50,68);
  quest::spawn2(294600,0,0,516,-182,-50,68);
}
