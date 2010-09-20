my $IIacounter;

sub EVENT_SPAWN {
    $IIacounter = 0;
    if ($qglobals{potb_p3_comp_pl} != 1) {
    quest::delglobal("potb_p1_start");
    quest::setglobal("potb_p1_comp",1,7,"H1"); #let potimea know we're on phase 2.
    quest::signalwith(223111,1001,0); #flavor
    quest::signalwith(223177,10,1);
    quest::spawn2(223163,0,0,-140,1737,547,0); #phase 2 timer
    quest::spawn2(223160,0,0,80,1645,495,64); #earth door
    quest::spawn2(223203,0,0,98,1645,495,195);
    quest::spawn2(223161,0,0,80,1355,495,64); #air door
    quest::spawn2(223204,0,0,98,1355,495,195);
    quest::spawn2(223162,0,0,80,1109,495,64); #undead door
    quest::spawn2(223205,0,0,98,1109,495,195);
    quest::spawn2(223202,0,0,80,868,495,64); #water door
    quest::spawn2(223207,0,0,98,868,495,195);
    quest::spawn2(223201,0,0,80,574,495,64); #fire door
    quest::spawn2(223206,0,0,98,574,495,195);
 
    quest::spawn_condition(potimeb,10,1);
    
    quest::depopall(223089); #clean up non-required leftovers from phase 1.
    quest::depopall(223094);
    quest::depopall(223095);
    quest::depopall(223147);
}
  else {
    quest::spawn2(223157,0,0,-410,-69,348,0);; #activated save point spawn phase 4
    quest::spawn2(223160,0,0,80,1645,495,64); #earth door
    quest::spawn2(223203,0,0,98,1645,495,195);
    quest::spawn2(223161,0,0,80,1355,495,64); #air door
    quest::spawn2(223204,0,0,98,1355,495,195);
    quest::spawn2(223162,0,0,80,1109,495,64); #undead door
    quest::spawn2(223205,0,0,98,1109,495,195);
    quest::spawn2(223202,0,0,80,868,495,64); #water door
    quest::spawn2(223207,0,0,98,868,495,195);
    quest::spawn2(223201,0,0,80,574,495,64); #fire door
    quest::spawn2(223206,0,0,98,574,495,195);
    quest::spawn2(223209,0,0,458,709,495,64); #doors
    quest::spawn2(223208,0,0,458,1101,495,64);
    quest::spawn2(223210,0,0,458,1502,495,64);
    }
}    
    
sub EVENT_SIGNAL {
  if ($signal == 10020) {
    quest::clearspawntimers();
    quest::spawn_condition(potimeb,10,0); #won't force a repop without this.
    quest::spawn_condition(potimeb,10,1);
    quest::spawn2(223134,0,0,262,1644,493,192.5);
    quest::spawn2(223118,0,0,262,1354,493,192.5);
    quest::spawn2(223127,0,0,262,1109,493,192.5);
    quest::spawn2(223096,0,0,262,869,493,192.5);
    quest::spawn2(223146,0,0,262,574,493,192.5);
}
  if ($signal == 10030) {
    $IIacounter += 1;
}
  if ($IIacounter == 5 ) { #phase 2 success
    quest::spawn2(223154,0,0,-140,1737,547,0); #phase 3 trigger
    quest::spawn_condition(potimeb,10,0); #set us to default.
    quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
    $IIacounter = 0;
}

  if($signal == 9909) {      
    quest::settimer("phase2",3600); #60 minute time limit
  }
 }

sub EVENT_TIMER {
	if ($timer eq "phase2") { 
		$check = 0;

		#phase3
		$check_boss = $entity_list->GetMobByNpcTypeID(223154);
		if ($check_boss) {
			$check = 1;
		}
		#phase4
		$check_boss = $entity_list->GetMobByNpcTypeID(223157);
		if ($check_boss) {
			$check = 1;
		}
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
			quest::shout("Phase 2 failed! Time expired.");
			quest::setglobal("timepokport",1,3,"M2");
			quest::spawn_condition(potimeb,10,0); #set us to default.
			quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
			quest::stoptimer("phase2");
			quest::signalwith(223177,666,0);
			quest::depopall(223132);
			quest::depopall(223136);
			quest::depopall(223126);
			quest::depopall(223141);
			quest::depopall(223148);
			quest::depopall(223153);
			quest::depopall(223096);
			quest::depopall(223117);
			quest::depopall(223143);
			quest::depopall(223114);
			quest::depopall(223137);
			quest::depopall(223109);
			quest::depopall(223124);
			quest::depopall(223146);
			quest::depopall(223110);
			quest::depopall(223125);
			quest::depopall(223102);
			quest::depopall(223133);
			quest::depopall(223134);
			quest::depopall(223107);
			quest::depopall(223138);
			quest::depopall(223127);
			quest::depopall(223216);
			quest::depopall(223118);
			quest::depopall(223163);
			quest::depop();
		} else {
			#new phase is running
			#we should start the timer for the next phase
			quest::stoptimer("phase2");
			quest::signalwith(223154,9909,0);
			quest::depop();
		}
	}
 }