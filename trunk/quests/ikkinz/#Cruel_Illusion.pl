sub EVENT_AGGRO {
  quest::settimer(1,1);
}
sub EVENT_TIMER {
  if(($x > 500) || ($x < 200) || ($y > -30) || ($y < -250)) {
    $npc->GMMove(442,-141,11,192);
  }
}

sub EVENT_DEATH {
$group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
      }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkylockout0", 1, "H17", 293117, $charid, 293);
     }
}