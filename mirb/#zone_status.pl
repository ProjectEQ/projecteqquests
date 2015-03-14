# Zone: mirb
# MOB Name: #zone_status
# MOB ID Number: 237774
#
my $instid = 0;

sub EVENT_SPAWN {
  #set timer to check for a player if the proximity fails to work (player already inside proximity).
  quest::settimer("GetClient",10);
  my $range = 2500;
  quest::set_proximity($x - $range, $x + $range, $y - $range, $y + $range);
}

sub EVENT_ENTER {
  $instid = quest::GetInstanceID('mirb',50); #get the instance id
  quest::clear_proximity();
  if($instid > 0) {
    quest::settimer("CheckGlobals",2);
    quest::stoptimer("GetClient");    
  }
}

sub EVENT_AGGRO {
  $instid = quest::GetInstanceID('mirb',50); #get the instance id
  #start timer to check the globals now that we have the instance ID
  if($instid > 0) {
    quest::settimer("CheckGlobals",2);
  } else {
    quest::settimer("GetClient",2);
  }
}

sub KICK_ALL_PLAYERS {
  #zone all players back to Everfrost
  foreach $pc ($entity_list->GetClientList()) {
    $pc->MovePC(30, -5460, -630, 190, 128);
  }
}

sub EVENT_TIMER {
  if ($timer eq "GetClient") { #begin checking for players
    if ($entity_list->GetClientList()) { #once we find a player
      quest::stoptimer("GetClient");
      #pick any client and "aggro" them so we can get the instance id
      my $rClient = $entity_list->GetRandomClient($x,$y,$z, 2000);
      if ($rClient) {
        quest::attack($rClient->GetName());
      } else {
        #failed to get a client. restart timer
        quest::settimer("GetClient",2);
      }
    }
  } elsif($timer eq "CheckGlobals") {
    quest::stoptimer("CheckGlobals");
    if(!defined $qglobals{$instid.'_mirb_status'}) {
      #if the zone global is not defined boot everyone and destroy the instance.
      KICK_ALL_PLAYERS();
      #destroy the instance 
      quest::DestroyInstance($instid);
    # Read qglobal for zone status to determine which events need spawned
    } elsif ($qglobals{$instid.'_mirb_status'} == 0) {
      #nothing to do at this time, the zone should be all up.
    } elsif ($qglobals{$instid.'_mirb_status'} == 1) { #goblin event started
      #send signal to trigger so it knows the event should be started.
      quest::signalwith(237798,237774,0);
      #pop all the future events.
      POP_EVENT1();
      POP_EVENT2();
      POP_EVENT3();
      POP_EVENT4();
      if ($qglobals{$instid.'_mirb_event'} == 0) { #event triggered, nothing dead.
        #spawn both bosses.
        quest::spawn2(237786,0,0,326.00, 1009.00, -53.625, 42.00); # Raid Leader Sig Chol
        quest::spawn2(237785,0,0,713.00, 970.00, 6.25, 71.00); # Taskmaster Suitalp
      } elsif ($qglobals{$instid.'_mirb_event'} == 1) { # Taskmaster dead.
        #spawn only raid leader
        quest::spawn2(237786,0,0,326.00, 1009.00, -53.625, 42.00); # Raid Leader Sig Chol
      } elsif ($qglobals{$instid.'_mirb_event'} == 2) { # Raid Leader dead
        #spawn only Taskmaster
        quest::spawn2(237785,0,0,713.00, 970.00, 6.25, 71.00); # Taskmaster Suitalp
      }
    } elsif ($qglobals{$instid.'_mirb_status'} == 2) { #goblin event completed, Durgin Skell events not done
      #despawn trigger_goblin (should not be up but safety check)
      quest::depop(237798); 
      #Check which of Durgin's events are completed
      if ($qglobals{$instid.'_mirb_event'}==0) { #none of Durgin's events completed, everything should be up
        POP_EVENT1();
        POP_EVENT2();
        POP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==1) { #event 1 done, nothing else
        DEPOP_EVENT1();
        POP_EVENT2();
        POP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==2) { #event 2 done, nothing else
        POP_EVENT1();
        DEPOP_EVENT2();
        POP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==3) { #events 1 and 2 done
        DEPOP_EVENT1();
        DEPOP_EVENT2();
        POP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==4) { #event 3 done, nothing else
        POP_EVENT1();
        POP_EVENT2();
        DEPOP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==5) { #events 1 and 3 done
        DEPOP_EVENT1();
        POP_EVENT2();
        DEPOP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==6) { #events 2 and 3 done
        POP_EVENT1();
        DEPOP_EVENT2();
        DEPOP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==7) { #events 1, 2, and 3 done
        DEPOP_EVENT1();
        DEPOP_EVENT2();
        DEPOP_EVENT3();
        POP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==8) { #event 4 failed, nothing else done
        POP_EVENT1();
        POP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==9) { #event 1 done, 4 failed
        DEPOP_EVENT1();
        POP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==10) { #event 2 done, 4 failed
        POP_EVENT1();
        DEPOP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==11) { #events 1 and 2 done, 4 failed
        DEPOP_EVENT1();
        DEPOP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==12) { #event 3 done, 4 failed
        POP_EVENT1();
        POP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==13) { #events 1 and 3 done, 4 failed
        DEPOP_EVENT1();
        POP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==14) { #events 2 and 3 done, 4 failed
        POP_EVENT1();
        DEPOP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==15) { #events 1, 2, and 3 done, 4 failed - _mirb_status should be 3
        DEPOP_EVENT1();
        DEPOP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4();
      } elsif ($qglobals{$instid.'_mirb_event'}==16) { #event 4 success, nothing else done
        POP_EVENT1();
        POP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==17) { #events 1 and 4 success
        DEPOP_EVENT1();
        POP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==18) { #events 2 and 4 success
        POP_EVENT1();
        DEPOP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==19) { #events 1, 2 and 4 success
        DEPOP_EVENT1();
        DEPOP_EVENT2();
        POP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==20) { #events 3 and 4 success
        POP_EVENT1();
        POP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==21) { #events 1, 3 and 4 success
        DEPOP_EVENT1();
        POP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==22) { #events 2, 3 and 4 success
        POP_EVENT1();
        DEPOP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4(1);
      } elsif ($qglobals{$instid.'_mirb_event'}==23) { #events 1, 2, 3 and 4 success - _mirb_status should be 4
        DEPOP_EVENT1();
        DEPOP_EVENT2();
        DEPOP_EVENT3();
        DEPOP_EVENT4(1);
      }
    } elsif ($qglobals{$instid.'_mirb_status'} == 3) { #all 4 of Durgin's events are done, no bonus
      #despawn trigger_goblin
      quest::depop(237798); 
      DEPOP_EVENT1();
      DEPOP_EVENT2();
      DEPOP_EVENT3();
      DEPOP_EVENT4();
    } elsif ($qglobals{$instid.'_mirb_status'} >= 4) { #all 4 of Durgin's events are done, with bonus
      #despawn trigger_goblin
      quest::depop(237798); 
      DEPOP_EVENT1();
      DEPOP_EVENT2();
      DEPOP_EVENT3();
      DEPOP_EVENT4(1);
    }
	#don't really care is Sharalla's corpse is up or not at this point.
	if ($qglobals{$instid.'_mirb_status'} == 5) { #Laskuth the Colossus dead, but chest(s) not opened
	  quest::spawn2(237790, 0, 0, 242, 360, -34, 0);
	  if ($qglobals{$instid.'_mirb_event'} == 2) { #spawn bonus chest
	    quest::spawn2(237763, 0, 0, 173, 402, -36, 0);
	  }
	} elsif ($qglobals{$instid.'_mirb_status'} == 6) { #win chest opened spawn bonus chest
	  quest::spawn2(237763, 0, 0, 173, 402, -36, 0);
	} elsif ($qglobals{$instid.'_mirb_status'} == 7) { #bonus chest opened spawn win chest
	  quest::spawn2(237790, 0, 0, 242, 360, -34, 0);
	}
	#status = 8 is complete win + chest(s) opened so nothing more to do.
    $npc->Depop(0); #depop no respawn timer because we always want this mob to spawn at zone start up
  }
}

sub POP_EVENT1 {
  DEPOP_EVENT1();
  quest::spawn2(237748,0,0,180,-5,6,55); #a_sundering_sludge
}

sub POP_EVENT2 {
  DEPOP_EVENT2();
  quest::spawn2(237756,0,0,-289,-19,-54.5,224); #a_chromatic_bonewalker
  quest::spawn2(237756,0,0,295,-582,-117.5,223); #a_chromatic_bonewalker
  quest::spawn2(237757,0,0,-334,-46,-54.5,28); #a_chromatic_bonewalker
  quest::spawn2(237791,0,0,220,-514,-85.875,35); #a_chromatic_bonewalker
}

sub POP_EVENT3 {
  DEPOP_EVENT3();
  quest::spawn2(237760,0,0,23,-319,58,0); #Marrow_the_Broken
}

sub POP_EVENT4 {
  DEPOP_EVENT4();
  quest::spawn2(237772,0,0,-104,-933,53.5,92.5); #Sharalla`s warder
  quest::spawn2(237773,0,0,-94,-944,55.375,51.5); #Sharalla`s corpse
}

sub DEPOP_EVENT1 {
  quest::depopall(237748); # a_sundering_sludge
  quest::depopall(237788); # a_severing_sludge - should not be up but safety check
  quest::depopall(237787); # a_slippery_sludge - should not be up but safety check
}

sub DEPOP_EVENT2 {
  quest::depopall(237756); # a_chromatic_bonewalker
  quest::depopall(237757); # a_chromatic_bonewalker
  quest::depopall(237791); # a_chromatic_bonewalker
  quest::depopall(237789); # an_icy_bonewalker - should not be up but safety check
}

sub DEPOP_EVENT3 {
  quest::depopall(237760); # Marrow_the_Broken
}

sub DEPOP_EVENT4 {
  quest::depopall(237772); # Sharalla`s warder
  if (!defined $_[0]) { #event 4 failed
    quest::depopall(237773); # Sharalla`s corpse
  }
  quest::depopall(237793); # a_starving_polar_bear - should not be up but safety check
  quest::depopall(237794); # a_ravenous_snow_cougar - should not be up but safety check
  quest::depopall(237795); # a_ravenous_snow_cougar - should not be up but safety check
  quest::depopall(237796); # a_famished_leopard - should not be up but safety check
}