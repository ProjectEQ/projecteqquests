sub EVENT_CLICKDOOR {
  my $x = $client->GetX();
  my $y = $client->GetY();
  my $z = $client->GetZ();
  my $destx = 0;
  my $desty = 0;
  my $destz = 0;
  my $group = $entity_list->GetGroupByClient($client);

  if ($group) { #This code is purely for grouped members teleporting.
    if ($doorid == 2 || $doorid == 166) { #First Floor Door
      if ($client->KeyRingCheck(20033) || plugin::check_hasitem($client, 20033)) {
        $destx = 660;
        $desty = 100;
        $destz = 40;
      }
    } elsif ($doorid == 4 || $doorid == 167) { #Second Floor Door
      if ($client->KeyRingCheck(20034) || plugin::check_hasitem($client, 20034)) {
        $destx = 670;
        $desty = 750;
        $destz = 75;
      }
    } elsif ($doorid == 16 || $doorid == 165) { #Third Floor Door
      if ($client->KeyRingCheck(20035) || plugin::check_hasitem($client, 20035)) {
        $destx = 170;
        $desty = 755;
        $destz = 175;
      }
    } elsif ($doorid == 27 || $doorid == 169) { #Fourth Floor Door
      if ($client->KeyRingCheck(20036) || plugin::check_hasitem($client, 20036)) {
        $destx = -150;
        $desty = 160;
        $destz = 217;
      }
    } elsif ($doorid == 34 || $doorid == 168) { #Fifth Floor Door
      if ($client->KeyRingCheck(20037) || plugin::check_hasitem($client, 20037)) {
        $destx = -320;
        $desty = 725;
        $destz = 12;
      }
    } elsif ($doorid == 1) { #Sixth Floor Door
      if ($client->KeyRingCheck(20039) || plugin::check_hasitem($client, 20039)) {
        $destx = 20;
        $desty = 250;
        $destz = 355;
      }
    }
	if ($destx != 0) { #Key trigger found. Teleport nearby group members.
      for ($count = 0; $count < $group->GroupCount(); $count++) {
        my $pc = $group->GetMember($count);
        if ($pc->CharacterID() != $client->CharacterID() && $pc->CalculateDistance($x, $y, $z) <= 40) {
          $pc->MovePC(111, $destx, $desty, $destz, 0);
        }
      }
    }
  }
}