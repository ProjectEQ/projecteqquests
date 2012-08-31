my $instid = 0;

sub EVENT_SPAWN {
  #set timer to check for a player to zone in.
  quest::settimer(1,2);
}

sub EVENT_AGGRO {
  $instid = quest::GetInstanceID('inktuta',0); #get the instance id
  #start timer 2 to check the globals now that we have the instance ID
  if($instid > 0) {
    quest::settimer(2,2);
  } else {
    quest::settimer(1,2);
  }
}

sub EVENT_TIMER {
  if ($timer == 1) { #begin checking for players
    if ($entity_list->GetClientList()) { #once we find a player
      quest::stoptimer(1);
      #pick any client and "aggro" them so we can get the instance id
      my $rClient = $entity_list->GetRandomClient($x,$y,$z, 1500);
      if ($rClient) {
        quest::attack($rClient->GetName());
      } else {
        #failed to get a client. restart timer 1
        quest::settimer(1,2);
      }
    }
  } elsif($timer == 2) {
    quest::stoptimer(2);
    if(!defined $qglobals{$instid.'_inktuta'}) {
      #if the zone global is not defined boot everyone and destroy the instance.
      KICK_ALL_PLAYERS();
      #destroy the instance 
      quest::DestroyInstance($instid);
    } else {
      if(!defined $qglobals{$instid.'_inktuta_status'}) { #check for their instance global to exist
        quest::targlobal($instid.'_inktuta_status',0,"H6",0,0,296); #create it if it does not.
      #if the global exists begin to check it's values
      } elsif($qglobals{$instid.'_inktuta_status'} == 0) { #0 means nothing done, nothing to do here.
        #if(!$entity_list->GetMobByNpcTypeID(296023)){ 
          #quest::spawn2(296023,0,0,353,-656,--2,194); #Servant_of_Keleldrix
        #}
      } elsif($qglobals{$instid.'_inktuta_status'} == 1) { #Kelekdrix spawned
        quest::spawn2(296024,537949,0,480,-416,4,56); #Kelekdrix,_Herald_of_Trushar
      } elsif($qglobals{$instid.'_inktuta_status'} == 2) {
        OPEN_DOORS(1);
        quest::spawn2(296027,0,0,165,-496,-27,64); #Mimezpo_the_Oracle
      } elsif($qglobals{$instid.'_inktuta_status'} == 3) {
        OPEN_DOORS(1);
        quest::spawn2(296030,0,0,-274,-531,-52,125); #a_rambling_exile
        quest::spawn2(296033,0,0,-557,-237,-2,63); #a_confused_exile
        quest::spawn2(296035,0,0,-406,-552,-77,62); #an_incoherent_exile
        quest::spawn2(296036,0,0,-355,-554,-77,190); #an_irrational_exile
      } elsif($qglobals{$instid.'_inktuta_status'} == 4) {
        OPEN_DOORS(2);
      } elsif($qglobals{$instid.'_inktuta_status'} == 5) {
        OPEN_DOORS(2);
        REMOVE_LOOSE_TILES(1);
        quest::spawn2(296048,0,0,-454,-500,-72,192); #a_clay_monolith
        quest::spawn2(296048,0,0,-494,-401,-72,128); #a_clay_monolith
        quest::spawn2(296048,0,0,-533,-500,-72,54); #a_clay_monolith
      } elsif($qglobals{$instid.'_inktuta_status'} == 6) {
        OPEN_DOORS(2);
        REMOVE_LOOSE_TILES(2);
        quest::spawn2(296048,0,0,-533,-580,-97,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-649,-97,192); #a_clay_monolith
        quest::spawn2(296048,0,0,-533,-649,-97,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-580,-97,192); #a_clay_monolith
      } elsif($qglobals{$instid.'_inktuta_status'} == 7) {
        OPEN_DOORS(2);
        REMOVE_LOOSE_TILES(3);
        quest::spawn2(296048,0,0,-533,-737,-122,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-533,-798,-122,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-798,-122,192); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-737,-122,192); #a_clay_monolith
      } elsif($qglobals{$instid.'_inktuta_status'} == 8) {
        OPEN_DOORS(2);
        REMOVE_LOOSE_TILES(4);
        quest::spawn2(296048,0,0,-371,-953,-122,0); #a_clay_monolith
        quest::spawn2(296048,0,0,-296,-953,-122,0); #a_clay_monolith
        quest::spawn2(296048,0,0,-296,-869,-122,128); #a_clay_monolith
        quest::spawn2(296048,0,0,-371,-869,-122,128); #a_clay_monolith
        quest::spawn2(296052,0,0,-166,-911,-127,194); #Noqufiel
      } elsif($qglobals{$instid.'_inktuta_status'} == 9) {
        OPEN_DOORS(3);
        REMOVE_LOOSE_TILES(4);
        quest::spawn2(296065,0,0,-55,-653,-127,121); #True_Image_of_Noqufiel
        quest::spawn2(296066,0,0,-103,-652,-127,125); #Mirror_Image_of_Noqufiel
      } elsif($qglobals{$instid.'_inktuta_status'} == 10) {
        #true image of noqufiel defeated but jomica not talked to.
        OPEN_DOORS(3);
        REMOVE_LOOSE_TILES(4);
        quest::spawn2(296071,0,0,-55, -653, -127, 121); #Jomica_the_Unforgiven
      } elsif($qglobals{$instid.'_inktuta_status'} >= 11) {
        #event completed nothing to restart, but unlock/depop everything that should be down.
        OPEN_DOORS(3);
        REMOVE_LOOSE_TILES(4);
        quest::spawn2(296067,0,0,-63,-600,-127,128);  #an ancient sentinel
      }
      $npc->Depop(0); #depop no respawn timer because we always want this mob to spawn at zone start up
    }
  }
}

sub KICK_ALL_PLAYERS {
  #zone all players back to qvic
  my @pc_list = $entity_list->GetClientList();
  foreach $pc ($entity_list->GetClientList()) {
    $pc->MovePC(295, -1014, -1345, -490, 128);
  }
}

sub OPEN_DOORS {
  if($_[0] == 1) {
    $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
  } elsif($_[0] == 2) {
    $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
    $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
  } elsif($_[0] == 3) {
    $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
    $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
    $entity_list->FindDoor(42)->SetLockPick(0); #unlock the doors for the Noqufiel event
    $entity_list->FindDoor(43)->SetLockPick(0); #unlock the doors for the Noqufiel event
  }
}

sub REMOVE_LOOSE_TILES {
  if($_[0] == 1) {
    quest::depopall(296020);
    quest::depopall(296002); # a_loose_tile was triggered
  } elsif($_[0] == 2) {
    quest::depopall(296020);
    quest::depopall(296002); # a_loose_tile was triggered
    quest::depop(296045);
    quest::depopall(296049); # a_loose_tile2 was triggered
  } elsif($_[0] == 3) {
    quest::depopall(296020);
    quest::depopall(296002); # a_loose_tile was triggered
    quest::depopall(296045);
    quest::depopall(296049); # a_loose_tile2 was triggered
    quest::depopall(296046);
    quest::depopall(296050); # a_loose_tile3 was triggered
  } elsif($_[0] == 4) {
    quest::depopall(296020);
    quest::depopall(296002); # a_loose_tile was triggered
    quest::depopall(296045);
    quest::depopall(296049); # a_loose_tile2 was triggered
    quest::depopall(296046);
    quest::depopall(296050); # a_loose_tile3 was triggered
    quest::depopall(296047);
    quest::depopall(296051); # a_loose_tile4 was triggered
  }
}