sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 325 || $x < 160 || $y > -400 || $y < -825) {
    $npc->GMMove(243,-501,3,242);
  }
}
sub EVENT_DEATH {
$raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
}
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("ikkylockout3", 1, "H6", 293115, $charid, 293);
  }
}