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
  }
}

sub EVENT_AGGRO {
  $instid = quest::GetInstanceID("vxed",0);
  $npc->WipeHateList();
  if(!defined $qglobals{$instid.'_vxed_status'}) { #check for their instance global to exist
    quest::targlobal($instid.'_vxed_status',0,"H6",0,0,0); #create it if it does not.
  } elsif($qglobals{$instid.'_vxed_status'} >= 50) {
    SPAWN_EKIKOA();
  }
  $npc->Depop(0);
}

sub SPAWN_EKIKOA {
  if(!$entity_list->GetMobByNpcTypeID(290062)) {
    quest::spawn2(290062,0,0,-1156,396,469,166);
    quest::ze(1,"A series of low chants comes to you from the Northeast, as Stonespiritist Ekikoa emerges from the shadows.");
  }
}