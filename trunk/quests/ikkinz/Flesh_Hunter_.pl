sub EVENT_DEATH {
  quest::signalwith(294142,1,0);
  $group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
       }
      }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkylockout2", 1, "H17", 293118, $charid, 293);
        }
}