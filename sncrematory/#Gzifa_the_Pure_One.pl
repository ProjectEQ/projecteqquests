sub EVENT_SPAWN {
  quest::ze(15, "My time here is short! Come find me for your reward!");
  quest::settimer(1, 900);
  quest::depop(288086);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::ze(15, "I must leave now, farewell.");
  quest::depop();
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55608 => 1, 55609 => 1, 55610 => 1, 55611 => 1)) {
    quest::stoptimer(1);
    $group = $entity_list->GetGroupByClient($client);
    if ($group) {
      for ($count = 0; $count < $group->GroupCount(); $count++) {
        if ($group->GetMember($count)) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
      }
    }
    foreach $player (@player_list) {
      $pc = $entity_list->GetClientByName($player);
      $charid = $pc->CharacterID();
      quest::targlobal("temp_sewers", 2, "F", 283052, $charid, 283);
      $pc->Message(4, "You receive a temporary flag!");
    }
    quest::depop();
  } 
  plugin::return_items(\%itemcount);
}