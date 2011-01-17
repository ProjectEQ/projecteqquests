my $godcounterI;

sub EVENT_SPAWN {
    $godcounterI = 0;

    quest::signalwith(223111,1003,0); #flavor
    quest::spawn2(223075,0,0,-310,307,365,95); #Terris Thule
    quest::spawn2(223076,0,0,-320,-316,358,32.5); #Saryrn
    quest::spawn2(223077,0,0,405,-84,358,192); #Tallon Zek
    quest::spawn2(223078,0,0,405,75,358,192); #Vallon Zek
	quest::depop(223996); #depop phase2_flag
	quest::spawn2(223997, 0, 0, 1633, 1108, 371, 192);#phase3_flag
}    
    
sub EVENT_SIGNAL {
  if ($signal == 12010) {
    $godcounterI += 1;
}
  if ($signal == 12011) { #depop Vallons crew after his death
    $godcounterI += 1;
    quest::settimer("vallon",300);
}
  if ($signal == 12012) { #depop Saryrns crew after her death
    $godcounterI += 1;
    quest::settimer("saryrn",1800);
}
  if ($signal == 12013) { #depop Terris crew after her death
    $godcounterI += 1;
    quest::settimer("terris",1800);
}
  if ($godcounterI == 4) { #event success
    quest::spawn2(223158,0,0,-415.5,-68.8,3.3,0);
    $godcounterI = 0;
}

  if($signal == 9909) {
    quest::settimer("phase4",14400); #240 minute time limit    
  }
 }

sub EVENT_TIMER {
	if ($timer eq "phase4") { 
		$check = 0;

		#phase5
		$check_boss = $entity_list->GetMobByNpcTypeID(223158);
		if ($check_boss) {
			$check = 1;
		}
		#quarm
		$check_boss = $entity_list->GetMobByNpcTypeID(223159);
		if ($check_boss) {
			$check = 1;
		}	
		
		if($check == 0) {
			#then we need to end the event
    quest::shout("Phase 4 failed! Time expired.");
    quest::stoptimer("phase4");
    quest::signalwith(223177,666,0);
    quest::depopall(223083);
    quest::depopall(223084);
    quest::depopall(223085);
    quest::depopall(223086);
    quest::depopall(223079);
    quest::depopall(223080);
    quest::depopall(223081);
    quest::depopall(223082);
    quest::depopall(223164);
    quest::depopall(223075);
    quest::depopall(223076);
    quest::depopall(223077);
    quest::depopall(223078);
    quest::depop();
		} else {
			#new phase is running
			#we should start the timer for the next phase
			quest::stoptimer("phase4");
			quest::signalwith(223158,9909,0);
			quest::depop();
		}
	}

  if ($timer eq "vallon") { #depop Vallons crew after his death
    quest::depopall(223164);
    quest::stoptimer("vallon");
}
  if ($timer eq "saryrn") { #depop Saryrns crew after her death
    quest::depopall(223083);
    quest::depopall(223084);
    quest::depopall(223085);
    quest::depopall(223086);
    quest::stoptimer("saryrn");
}
  if ($timer eq "terris") { #depop Terris crew after her death
    quest::depopall(223079);
    quest::depopall(223080);
    quest::depopall(223081);
    quest::depopall(223082);
    quest::stoptimer("terris");
 } 
}
