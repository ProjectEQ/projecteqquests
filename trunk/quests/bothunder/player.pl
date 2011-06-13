sub EVENT_CLICKDOOR {
  my $x = $client->GetX();
  my $y = $client->GetY();
  my $z = $client->GetZ();
  my $raid = $entity_list->GetRaidByClient($client);
  my $group = $entity_list->GetGroupByClient($client);

  if($doorid == 51) { #Agnarr Tower
    if($status > 79) { #GM status
      $client->MovePC(209, -765, -1735, 1270, 0);
    }
    elsif(plugin::check_hasitem($client, 9433)) { #Symbol of Torden
      if($raid) { #Move raid
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          my $pc = $raid->GetMember($count);
          if($pc->CalculateDistance($x, $y, $z) <= 100) {
            $pc->MovePC(209, -765, -1735, 1270, 0);
          }
        }
      }
      elsif($group) { #Move group
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          my $pc = $group->GetMember($count);
          if($pc->CalculateDistance($x, $y, $z) <= 100) {
            $pc->MovePC(209, -765, -1735, 1270, 0);
          }
        }
      }
      else { #Move player
        $client->MovePC(209, -765, -1735, 1270, 0);
      }
    }
    else { #Send gargoyles to attack
      my @npc_list = $entity_list->GetNPCList();
      foreach $npc (@npc_list) {
        if($npc->GetNPCTypeID() == 209024) {
          $npc->AddToHateList($client, 1);
        }
      }
    }
  }
  if($doorid == 61) { #SE tower
    if($status > 79) { #GM status
      $client->MovePC(209, 85, 145, 635, 128);
    }
    elsif($client->KeyRingCheck(9425) || plugin::check_hasitem($client, 9425)) { #Ring of Torden
      if(!$client->KeyRingCheck(9425)) {
        $client->KeyRingAdd(9425);
      }
      if($raid) {
        my $raid_group = $raid->GetGroup($name);
        if($raid_group >= 0) {
          for ($count = 0; $count < $raid->RaidCount(); $count++) {
            my $pc = $raid->GetMember($count);
            if($raid->GetGroup($pc->GetName()) == $raid_group) {
              if($pc->CalculateDistance($x, $y, $z) <= 50) {
                $pc->MovePC(209, 85, 145, 635, 128);
              }
            }
          }
        }
        else { #Move player
          $client->MovePC(209, 85, 145, 635, 128);
        }
      }
      elsif($group) { #Move group
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          my $pc = $group->GetMember($count);
          if($pc->CalculateDistance($x, $y, $z) <= 50) {
            $pc->MovePC(209, 85, 145, 635, 128);
          }
        }
      }
      else { #Move player
        $client->MovePC(209, 85, 145, 635, 128);
      }
    }
    else { #Send gargoyles to attack
      my @npc_list = $entity_list->GetNPCList();
      foreach $npc (@npc_list) {
        if($npc->GetNPCTypeID() == 209110) {
          $npc->AddToHateList($client, 1);
        }
      }
    }
  }
  if($doorid == 63) { #SW tower
    if($status > 79) { #GM status
      $client->MovePC(209, -830, -865, 1375, 128);
    }
    elsif($client->KeyRingCheck(9425) || plugin::check_hasitem($client, 9425)) { #Ring of Torden
      if(!$client->KeyRingCheck(9425)) {
        $client->KeyRingAdd(9425);
      }
      if($raid) {
        my $raid_group = $raid->GetGroup($name);
        if($raid_group >= 0) {
          for ($count = 0; $count < $raid->RaidCount(); $count++) {
            my $pc = $raid->GetMember($count);
            if($raid->GetGroup($pc->GetName()) == $raid_group) {
              if($pc->CalculateDistance($x, $y, $z) <= 50) {
                $pc->MovePC(209, -830, -865, 1375, 128);
              }
            }
          }
        }
        else { #Move player
          $client->MovePC(209, -830, -865, 1375, 128);
        }
      }
      if($group) { #Move group
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          my $pc = $group->GetMember($count);
          if($pc->CalculateDistance($x, $y, $z) <= 50) {
            $pc->MovePC(209, -830, -865, 1375, 128);
          }
        }
      }
      else { #Move player
        $client->MovePC(209, -830, -865, 1375, 128);
      }
    }
    else { #Send gargoyles to attack
      my @npc_list = $entity_list->GetNPCList();
      foreach $npc (@npc_list) {
        if($npc->GetNPCTypeID() == 209111) {
          $npc->AddToHateList($client, 1);
        }
      }
    }
  }
  if($doorid == 65) { #NW tower
    if($status > 79) { #GM status
      $client->MovePC(209, -350, -2200, 1955, 255);
    }
    elsif($client->KeyRingCheck(9425) || plugin::check_hasitem($client, 9425)) { #Ring of Torden
      if(!$client->KeyRingCheck(9425)) {
        $client->KeyRingAdd(9425);
      }
      if($raid) {
        my $raid_group = $raid->GetGroup($name);
        if($raid_group >= 0) {
          for ($count = 0; $count < $raid->RaidCount(); $count++) {
            my $pc = $raid->GetMember($count);
            if($raid->GetGroup($pc->GetName()) == $raid_group) {
              if($pc->CalculateDistance($x, $y, $z) <= 50) {
                $pc->MovePC(209, -350, -2200, 1955, 255);
              }
            }
          }
        }
        else { #Move player
          $client->MovePC(209, -350, -2200, 1955, 255);
        }
      }
      if($group) { #Move group
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          my $pc = $group->GetMember($count);
          if($pc->CalculateDistance($x, $y, $z) <= 50) {
            $pc->MovePC(209, -350, -2200, 1955, 255);
          }
        }
      }
      else { #Move player
        $client->MovePC(209, -350, -2200, 1955, 255);
      }
    }
    else { #Send gargoyles to attack
      my @npc_list = $entity_list->GetNPCList();
      foreach $npc (@npc_list) {
        if($npc->GetNPCTypeID() == 209112) {
          $npc->AddToHateList($client, 1);
        }
      }
    }
  }
  if($doorid == 67) { #NE tower
    if($status > 79) { #GM status
      $client->MovePC(209, 150, -1220, 1120, 128);
    }
    elsif($client->KeyRingCheck(9425) || plugin::check_hasitem($client, 9425)) { #Ring of Torden
      if(!$client->KeyRingCheck(9425)) {
        $client->KeyRingAdd(9425);
      }
      if($raid) {
        my $raid_group = $raid->GetGroup($name);
        if($raid_group >= 0) {
          for ($count = 0; $count < $raid->RaidCount(); $count++) {
            my $pc = $raid->GetMember($count);
            if($raid->GetGroup($pc->GetName()) == $raid_group) {
              if($pc->CalculateDistance($x, $y, $z) <= 50) {
                $pc->MovePC(209, 150, -1220, 1120, 128);
              }
            }
          }
        }
        else { #Move player
          $client->MovePC(209, 150, -1220, 1120, 128);
        }
      }
      if($group) { #Move group
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          my $pc = $group->GetMember($count);
          if($pc->CalculateDistance($x, $y, $z) <= 50) {
            $pc->MovePC(209, 150, -1220, 1120, 128);
          }
        }
      }
      else { #Move player
        $client->MovePC(209, 150, -1220, 1120, 128);
      }
    }
    else { #Send gargoyles to attack
      my @npc_list = $entity_list->GetNPCList();
      foreach $npc (@npc_list) {
        if($npc->GetNPCTypeID() == 209113) {
          $npc->AddToHateList($client, 1);
        }
      }
    }
  }
}