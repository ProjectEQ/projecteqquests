sub EVENT_SPAWN {
  quest::setnexthpevent(50);
}

sub EVENT_HP {
if($hpevent == 50) {
  $check_named = $entity_list->GetMobByNpcTypeID(294617);
	if ($check_named) {
        $npc->SetHP(750000);
        quest::emote("The Oracle has been sustained by his companions.");
        }
        quest::setnexthpevent(50);
  }
}
sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x < 875 || $y < -583 || $y > -334) {
    $npc->GMMove(1031,-459,-73,192);
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
     quest::targlobal("ikkylockout6", 1, "H6", 293114, $charid, 293);
  }
}