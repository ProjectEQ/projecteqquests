my $instid = 0;

sub EVENT_SPAWN {
  quest::settimer(1,15);  #timer for finding a player to get the instance ID from
}

sub EVENT_TIMER {
  if ($timer == 1) { #begin checking for players
    if ($entity_list->GetClientList()) { #once we find a player
      quest::stoptimer(1);
      #pick any client and "aggro" them so we can get the instance id
      my $rClient = $entity_list->GetRandomClient($x,$y,$z, 3700);
      if ($rClient) {
        quest::attack($rClient->GetName());
      } else {
        #failed to get a client. restart timer 1
        quest::settimer(1,2);
      }
    }
  } elsif ($timer == 2) { #populate zone as needed.
    quest::stoptimer(2);
    if(!defined $qglobals{$instid.'_tipt'}) {
      #if the zone global is not defined boot everyone and destroy the instance.
      KICK_ALL_PLAYERS();
      #destroy the instance 
      
      # Destrying Instances can probably cause problems
      #quest::DestroyInstance($instid);

      #destroy the instance status variable if it exists.
      if(defined $qglobals{$instid.'_tipt_status'}) {
        quest::delglobal($instid.'_tipt_status');
      }
    } else {
      if(!defined $qglobals{$instid.'_tipt_status'}) { #check for their instance global to exist
        quest::targlobal($instid.'_tipt_status',0,"H6",0,0,0); #create it if it does not.
        #make sure the cragbeast trigger is up.
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289045)){ #aemc_trigger
          quest::spawn2(289045,0,0,-2005,163,250,0); #aemc_trigger
        }
      } elsif($qglobals{$instid.'_tipt_status'} == 0) { #0 means nothing done
        #make sure the cragbeast trigger is up.
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289045)){ #aemc_trigger
          quest::spawn2(289045,0,0,-2005,163,250,0); #aemc_trigger
        }
      } elsif($qglobals{$instid.'_tipt_status'} == 1) { #baby crags spawned
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289045)){ #aemc_trigger
          quest::spawn2(289045,0,0,-2005,163,250,0); #aemc_trigger
        }
        quest::spawn2(289034,0,0,-2106,188,250,78);
        quest::spawn2(289034,0,0,-2075,246,250,120);
        quest::spawn2(289034,0,0,-2019,247,250,103);
        quest::spawn2(289034,0,0,-1945,257,250,143);
        quest::spawn2(289034,0,0,-1895,196,250,167);
        quest::spawn2(289034,0,0,-1865,140,250,213);
        quest::spawn2(289034,0,0,-1953,94,250,222);
        quest::spawn2(289034,0,0,-2047,125,250,22);      
      } elsif($qglobals{$instid.'_tipt_status'} == 2) { #mother spawned
        quest::spawn2(289036,0,0,-2040,196,250,113); #spawn #an_enraged_maternal_cragbeast
        if($entity_list->IsMobSpawnedByNpcTypeID(289045)){ #aemc_trigger
          quest::depop(289045); #aemc_trigger
        }
      } elsif($qglobals{$instid.'_tipt_status'} == 3) { #ghost room ready
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289046)){ #ghost_trigger
          quest::spawn2(289046,0,0,-1290,891,398,0); #ghost_trigger
        }
      } elsif($qglobals{$instid.'_tipt_status'} == 4) { #ghost room spawned
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289046)){ #ghost_trigger
          quest::spawn2(289046,0,0,-1290,891,398,194); #ghost_trigger
        }
        quest::ze(13,'shivers run up and down your spine, something is not quite right here, the area feels quite chill and desolate'); 
        quest::spawn2(289035,0,0,-1274,996,396,191);
        quest::spawn2(289035,0,0,-1351,796,394,4);
        quest::spawn2(289035,0,0,-1323,996,396,64);
        quest::spawn2(289035,0,0,-1275,779,396,193);
        quest::spawn2(289035,0,0,-1348,973,394,122);
        quest::spawn2(289035,0,0,-1321,779,396,63);
        quest::spawn2(289035,0,0,-1254,799,395,246);
        quest::spawn2(289035,0,0,-1249,962,394,153);
      } elsif($qglobals{$instid.'_tipt_status'} == 5) { #Garjah spawned
        quest::spawn2(289033,0,0,-1290,891,398,0); #spawn Garkah Zotaki
      } elsif($qglobals{$instid.'_tipt_status'} == 6) { #aneuk trigger spawned
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289047)){ #aneuk_trigger
          quest::spawn2(289047,0,0,-793,1592,539,0); #aneuk_trigger
        }
      } elsif($qglobals{$instid.'_tipt_status'} == 7) { #aneuk key mob spawned
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289038)) { #an_aneuk_fleshweaver
          quest::spawn2(289038,0,0,-804,1583,538,121); #an_aneuk_fleshweaver
        }
      } elsif($qglobals{$instid.'_tipt_status'} == 8) { #an_aneuk_fleshweaver killed
        #nothing to do on zone startup for this state.
      } elsif($qglobals{$instid.'_tipt_status'} == 9) { #riddle answered
        $entity_list->FindDoor(4)->SetLockPick(0);
      } elsif($qglobals{$instid.'_tipt_status'} == 10) { #final gate opened once with key.
        $entity_list->FindDoor(3)->SetLockPick(0);
        $entity_list->FindDoor(4)->SetLockPick(0);
      } elsif($qglobals{$instid.'_tipt_status'} == 11) { #Jhiru dead.
        if(!$entity_list->IsMobSpawnedByNpcTypeID(289032)){ #Master_Stonespiritist_Okkanu
          quest::spawn2(289032,0,0,1411,2143,730,242); #Master_Stonespiritist_Okkanu
        }
      }
    }
    $npc->Depop(0);
  }
}

sub EVENT_AGGRO {
  $instid = quest::GetInstanceID("tipt",0);
  $npc->WipeHateList();
  #start timer 2 to check the globals now that we have the instance ID
  if($instid > 0) {
    quest::settimer(2,2);
  } else {
    quest::settimer(1,2);
  }
}

sub KICK_ALL_PLAYERS {
  #zone all players back to barindu
  my @pc_list = $entity_list->GetClientList();
  foreach $pc ($entity_list->GetClientList()) {
    $pc->MovePC(283, -1225, 501, -121, 174);
  }
}
