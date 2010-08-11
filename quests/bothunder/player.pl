my @player_list = ();

sub EVENT_CLICKDOOR {
  if($doorid == 51) { # agnarr entrance
    if($client->KeyRingCheck(9433) || ($status > 79)) {
      $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
        foreach $player (@player_list) {
          my $pc = $entity_list->GetClientByName($player);
          $pc->MovePC(209,-765,-1735,1270);
        }
      }
    } elsif(plugin::check_hasitem($client, 9433)) {
      $client->KeyRingAdd(9433);
      $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
        foreach $player (@player_list) {
          my $pc = $entity_list->GetClientByName($player);
          $pc->MovePC(209,-765,-1735,1270);
        }
      }
    } else {
      my $gargoyle_check = $entity_list->GetMobByNpcTypeID(209024);
      if ($gargoyle_check) {
        my $gargoyle = $gargoyle_check->CastToNPC();
        $gargoyle->AddToHateList($client, 1);
      }
    }
  } elsif($doorid == 61) { # tower
    if($client->KeyRingCheck(9425) || ($status > 79)) {
      quest::movegrp(209, 85, 145, 635);
    } elsif(plugin::check_hasitem($client, 9425)) {
      $client->KeyRingAdd(9425);
      quest::movegrp(209, 85, 145, 635);
    }
  } elsif($doorid == 63) { # tower
    if($client->KeyRingCheck(9425) || ($status > 79)) {
      quest::movegrp(209, -830, -865, 1375);
    } elsif(plugin::check_hasitem($client, 9425)) {
      $client->KeyRingAdd(9425);
      quest::movegrp(209, -830, -865, 1375);
    }
  } elsif($doorid == 65) { # tower
    if($client->KeyRingCheck(9425) || ($status > 79)) {
      quest::movegrp(209, -350, -2200, 1955);
    } elsif(plugin::check_hasitem($client, 9425)) {
      $client->KeyRingAdd(9425);
      quest::movegrp(209, -350, -2200, 1955);
    }
  } elsif($doorid == 67) { # tower
    if($client->KeyRingCheck(9425) || ($status > 79)) {
      quest::movegrp(209, 150, -1220, 1120);
    } elsif(plugin::check_hasitem($client, 9425)) {
      $client->KeyRingAdd(9425);
      quest::movegrp(209, 150, -1220, 1120);
    }
  }
}