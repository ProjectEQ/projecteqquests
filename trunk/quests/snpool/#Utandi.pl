sub EVENT_SPAWN  {
$event = 0;
}

sub EVENT_SAY {
  if (defined $qglobals{sewers} && $qglobals{sewers} == 5) {
  if ($text=~/hail/i) {
  if ($event == 0) {
    quest::say("I have a problem");
    }
  }
}
  if (defined $qglobals{sewers} && $qglobals{sewers} == 5) {
    if ($text=~/what problem/i) {
    if ($event == 0) {
  quest::say("I have lost my map.  It shows me how to get home. Can you help me find it?");
    }
  }
}
  if (defined $qglobals{sewers} && $qglobals{sewers} == 5) {
  if ($text=~/I will help you find it/i) {
      if ($event == 0) {
    quest::say("Thanks!  Try to find a big pile of slime, I think he has my map.");
    quest::spawn2(285085,0,0,1354,471,-138,187);
    $event = 1;
  }
  }
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55617 =>1, 55618 =>1, 55619 =>1, 55620 =>1 )) {
$group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
}
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::InsertQuestGlobal($charid, 283052,283,"temp_sewers", 4, "F");
   $pc->Message(4,"You receive a temporary flag!");
}
}
 plugin::return_items(\%itemcount);  
  }