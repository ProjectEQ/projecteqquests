sub EVENT_SPAWN {
    $npc->SetHP(25000);
    }
    
sub EVENT_DEATH {
  quest::signalwith(294141,1);
  $group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
      }
  foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkylockout1", 1, "H17", 293116, $charid, 293);
  }
}