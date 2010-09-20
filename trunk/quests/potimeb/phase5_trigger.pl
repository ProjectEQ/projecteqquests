my $godcounterII;

sub EVENT_SPAWN {
    $godcounterII = 0;
    quest::delglobal("potb_p3_comp");
    quest::setglobal("potb_p4_comp",1,7,"H4"); #general complete

    quest::signalwith(223111,1004,0); #flavor
    quest::spawn2(223098,0,0,-299,-297,23.3,31); #Fake Bertoxxulous
    quest::spawn2(223165,0,0,-257,255,6,101.5); #Fake Cazic
    quest::spawn2(223000,0,0,303.3,306,13.3,161.5); #Fake Innoruuk
    quest::spawn2(223001,0,0,264,-279,18.75,217.5); #Fake Rallos
    quest::spawn_condition(potimeb, 1,1); #armies
    quest::depopall(223164);
    quest::depopall(223083);
    quest::depopall(223084);
    quest::depopall(223085);
    quest::depopall(223086);
    quest::depopall(223079);
    quest::depopall(223080);
    quest::depopall(223081);
    quest::depopall(223082);

}

sub EVENT_SIGNAL {
  if ($signal == 13080) { #depop fake and pop the real gods
    quest::depopall(223098);
    quest::depopall(223165);
    quest::depopall(223000);
    quest::depopall(223001);
    quest::spawn2(223142,0,0,-299,-297,23.3,31); #Real Bertoxxulous
    quest::spawn2(223166,0,0,-257,255,6,101.5); #Real Cazic
    quest::spawn2(223167,0,0,303.3,306,13.3,161.5); #Real Innoruuk
    quest::spawn2(223168,0,0,264,-279,18.75,217.5); #Real Rallos
}
  if ($signal == 13010) {
    $godcounterII += 1;
}
  if ($godcounterII == 4) { #event success
    quest::spawn_condition(potimeb, 1,0); #set us to default.
    quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
    quest::spawn2(223159,0,0,166,-938,9.7,0); #spawn quarm_trigger
    $godcounterII = 0;
}
  if($signal == 9909) {
    quest::settimer("phase5",14400); #240 minute time limit
  }
 }

sub EVENT_TIMER {
	if ($timer eq "phase5") { 
		$check = 0;

		#quarm
		$check_boss = $entity_list->GetMobByNpcTypeID(223159);
		if ($check_boss) {
			$check = 1;
		}	
		
		if($check == 0) {
			#then we need to end the event
    quest::stoptimer("phase5");
    quest::spawn_condition(potimeb, 1,0); #set us to default.
    quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
    quest::shout("Phase 5 failed! Time expired.");
    quest::setglobal("timepokport",1,3,"M2");
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
    quest::depopall(223197);
    quest::depopall(223198);
    quest::depopall(223199);
    quest::depopall(223200);
    quest::depopall(223002);
    quest::depopall(223003);
    quest::depopall(223194);
    quest::depopall(223195);
    quest::depopall(223196);
    quest::depopall(223142);
    quest::depopall(223166);
    quest::depopall(223167);
    quest::depopall(223168);
    quest::depopall(223098);
    quest::depopall(223165);
    quest::depopall(223000);
    quest::depopall(223001);
    quest::depopall(223130);
    quest::depopall(223145);
    quest::depop();
		} else {
			#new phase is running
			#we should start the timer for the next phase
			quest::stoptimer("phase5");
			quest::signalwith(223159,9909,0);
			quest::depop();
		}
	}

 }