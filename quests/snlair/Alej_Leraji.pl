sub EVENT_SPAWN {
  quest::settimer(1,1);
  $event = 0;
  quest::spawn_condition($zonesn,3,0);
  }

sub EVENT_SAY {
  if ($text=~/hail/i) {
  if ($event == 1) {
    quest::say("You have found my three stone shaping tools.");
    $group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
}
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("temp_sewers", 3, "F", 283052, $charid, 283);
   $pc->Message(4,"You receive a temporary flag!");
}
}
}
elsif ($text=~/hail/i) {
  quest::say("Help me escape!  Wait, who sent you?");
}
}

sub EVENT_TIMER {
   if ($timer == 1) {
     $npc->SetAppearance(3);
     quest::stoptimer(1);
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 68298 =>1 )) {
    quest::say("I will help you if you can help me.  I've lost my tools.  Some of the denziens of the sewers stole them after I got trapped under this rock.  Get my tools so I can escape and I'll show you to the pool.");  #not live text
     quest::spawn2(286104,0,0,10,10,10,0);  #spawns lair trigger
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    $event = 1;
  }
}