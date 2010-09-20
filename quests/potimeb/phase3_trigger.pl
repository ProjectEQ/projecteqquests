my $namedI;
my $namedII;
my $namedIII;
my $namedIV;
my $namedV;
my $namedVI;
my $namedVII;
my $namedVIII;
my $namedIX;

sub EVENT_SPAWN {
    $namedI = 0;
    $namedII = 0;
    $namedIII = 0;
    $namedIV = 0;
    $namedV = 0;
    $namedVI = 0;
    $namedVII = 0;
    $namedVIII = 0;
    $namedIX = 0;
    quest::delglobal("potb_p1_comp");
    quest::setglobal("potb_p2_comp",1,7,"M75"); #general phase complete.
    quest::signalwith(223111,1002,0); #flavor
    quest::signalwith(223177,18,1); #doors
    quest::spawn2(223209,0,0,458,709,495,64); #doors
    quest::spawn2(223208,0,0,458,1101,495,64);
    quest::spawn2(223210,0,0,458,1502,495,64);
    quest::spawn2(223010,0,0,1280,1010,359.38,195); #non target nameds
    quest::spawn2(223011,0,0,1280,1030,359.38,195);
    quest::spawn2(223012,0,0,1260,1250,359.38,195);
    quest::spawn2(223013,0,0,1260,1270,359.38,195);
    quest::spawn2(223014,0,0,1280,1210,359.38,195);
    quest::spawn2(223015,0,0,1280,1190,359.38,195);
    quest::spawn2(223016,0,0,1260,970,359.38,195);
    quest::spawn2(223017,0,0,1260,950,359.38,195);
    quest::spawn2(223018,0,0,1300,1070,359.38,195);
    quest::spawn2(223019,0,0,1300,1090,359.38,195);
    quest::spawn2(223020,0,0,1300,1130,359.38,195);
    quest::spawn2(223021,0,0,1300,1150,359.38,195);
    quest::spawn2(223022,0,0,1230,1330,359.38,175);
    quest::spawn2(223023,0,0,1230,1310,359.38,175);
    quest::spawn2(223155,0,0,1250,1135,359.5,192);
    quest::spawn2(223156,0,0,1250,1085,359.5,192);
    quest::spawn_condition(potimeb,2,1); #1st wave
    quest::spawn2(223217,0,0,0,0,0,0); #this will be our wave counter
    quest::depopall(223179); #depop player counter
    quest::depopall(223178); #depop player counter
    quest::depopall(223182); #depop player counter
    quest::depopall(223180); #depop player counter
    quest::depopall(223181); #depop player counter
    quest::depopall(223110); #clean up last phase
    quest::depopall(223125);
    quest::depopall(223102);
    quest::depopall(223133);
    quest::depopall(223087);
    quest::depopall(223107);
    quest::depopall(223138);
    quest::depopall(223132);
    quest::depopall(223136);
    quest::depopall(223126);
    quest::depopall(223141);
    quest::depopall(223148);
    quest::depopall(223153);
    quest::depopall(223117);
    quest::depopall(223143);
    quest::depopall(223114);
    quest::depopall(223137);
    quest::depopall(223109);
    quest::depopall(223124);
}

sub EVENT_SIGNAL {
  if ($signal == 11018) { #spawn first 2 nameds
    quest::depopall(223155);
    quest::depopall(223156);
    quest::depopall(223217);
    quest::spawn2(223009,0,0,1250,1085,359.5,192);
    quest::spawn2(223008,0,0,1250,1135,359.5,192);
}
  if ($signal == 11010) { 
    $namedI += 1;
}
  if ($namedI == 2) { 
    quest::spawn_condition(potimeb,3,1); # wave 2
    quest::spawn2(223218,0,0,0,0,0,0); # wave counter
    quest::depopall(223016); #depop untargetable nameds
    quest::depopall(223017);
    quest::spawn2(223017,0,0,1250,1085,359.5,192); #pop targetable nameds in new locations
    quest::spawn2(223016,0,0,1250,1135,359.5,192);
    $namedI = 0;
    $namedII = 0;
 
}
  if ($signal == 11028) { #spawn second 2 nameds
    quest::depopall(223016);
    quest::depopall(223017);
    quest::depopall(223218);
    quest::spawn2(223024,0,0,1250,1085,359.5,192);
    quest::spawn2(223025,0,0,1250,1135,359.5,192);
}
 
  if ($signal == 11020) {
    $namedII += 1;
}
  if ($namedII == 2) {
    quest::spawn_condition(potimeb,4,1); #3
    quest::spawn2(223219,0,0,0,0,0,0);
    quest::depopall(223022);
    quest::depopall(223023);
    quest::spawn2(223023,0,0,1250,1085,359.5,192);
    quest::spawn2(223022,0,0,1250,1135,359.5,192);
    $namedII = 0;
    $namedIII = 0;
} 
  if ($signal == 11038) { #3
    quest::depopall(223022);
    quest::depopall(223023);
    quest::depopall(223219);
    quest::spawn2(223031,0,0,1250,1085,359.5,192);
    quest::spawn2(223032,0,0,1250,1135,359.5,192);
}
 
  if ($signal == 11030) {
    $namedIII += 1;
}
  if ($namedIII == 2) {
    quest::spawn_condition(potimeb,5,1); #4
    quest::spawn2(223220,0,0,0,0,0,0);
    quest::depopall(223012);
    quest::depopall(223013);
    quest::spawn2(223012,0,0,1250,1085,359.5,192);
    quest::spawn2(223013,0,0,1250,1135,359.5,192);
    $namedIII = 0;
    $namedIV = 0;
} 
  if ($signal == 11048) { #4
    quest::depopall(223012);
    quest::depopall(223013);
    quest::depopall(223220);
    quest::spawn2(223038,0,0,1250,1085,359.5,192);
    quest::spawn2(223037,0,0,1250,1135,359.5,192);

 }
  if ($signal == 11040) {
    $namedIV += 1;
}
  if ($namedIV == 2) {
    quest::spawn_condition(potimeb,6,1); #5
    quest::spawn2(223221,0,0,0,0,0,0);
    quest::depopall(223010);
    quest::depopall(223011);
    quest::spawn2(223010,0,0,1250,1085,359.5,192);
    quest::spawn2(223011,0,0,1250,1135,359.5,192);
    $namedIV = 0;
    $namedV = 0;
} 
  if ($signal == 11058) { #5
    quest::depopall(223010);
    quest::depopall(223011);
    quest::depopall(223221);
    quest::spawn2(223047,0,0,1250,1085,359.5,192);
    quest::spawn2(223046,0,0,1250,1135,359.5,192);
}
 
  if ($signal == 11050) {
    $namedV += 1;
}
  if ($namedV == 2) {
    quest::spawn_condition(potimeb,7,1); #6
    quest::spawn2(223222,0,0,0,0,0,0);
    quest::depopall(223014);
    quest::depopall(223015);
    quest::spawn2(223015,0,0,1250,1085,359.5,192);
    quest::spawn2(223014,0,0,1250,1135,359.5,192);
    $namedV = 0;
    $namedVI = 0;
} 
  if ($signal == 11068) { #6
    quest::depopall(223014);
    quest::depopall(223015);
    quest::depopall(223222);
    quest::spawn2(223050,0,0,1250,1085,359.5,192);
    quest::spawn2(223051,0,0,1250,1135,359.5,192);
}
 
  if ($signal == 11060) {
    $namedVI += 1;
}
  if ($namedVI == 2) {
    quest::spawn_condition(potimeb,8,1); #7
    quest::spawn2(223223,0,0,0,0,0,0);
    quest::depopall(223020);
    quest::depopall(223021);
    quest::spawn2(223020,0,0,1250,1085,359.5,192);
    quest::spawn2(223021,0,0,1250,1135,359.5,192);
    $namedVI = 0;
    $namedVII = 0;
} 
  if ($signal == 11078) { #7
    quest::depopall(223020);
    quest::depopall(223021);
    quest::depopall(223223);
    quest::spawn2(223058,0,0,1250,1085,359.5,192);
    quest::spawn2(223057,0,0,1250,1135,359.5,192);
}
 
  if ($signal == 11070) { 
     $namedVII += 1;
}
  if ($namedVII == 2) {
    quest::spawn_condition(potimeb,9,1); #final wave
    quest::spawn2(223224,0,0,0,0,0,0);
    quest::depopall(223018);
    quest::depopall(223019);
    quest::spawn2(223018,0,0,1250,1085,359.5,192);
    quest::spawn2(223019,0,0,1250,1135,359.5,192);

    $namedVII = 0;
    $namedVIII = 0;
} 
  if ($signal == 11088) { #last 2 nameds
    quest::depopall(223018);
    quest::depopall(223019);
    quest::depopall(223224);
    quest::spawn2(223066,0,0,1250,1085,359.5,192);
    quest::spawn2(223065,0,0,1250,1135,359.5,192);
}
 
  if ($signal == 11080) { 
    $namedVIII += 1;
}
  if ($namedVIII == 2) { #spawn golems
    quest::spawn2(223073,0,0,1492,1110,374.1,195.5);
    quest::spawn2(223074,0,0,1563,1110,374.1,195.5);
    $namedVIII = 0;
    $namedIX = 0;
} 
  if ($signal == 11090) { 
    $namedIX += 1;
} 
  if ($namedIX == 2) { #event success
    quest::spawn_condition(potimeb,9,0); #set us to default.
    quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
    quest::spawn2(223157,0,0,-410,-69,348,0); #spawn phase4_trigger
    $namedIX = 0;
} 

   if($signal == 9909) {
          quest::settimer("phase3",4500); #75 minute time limit
   }
 }

sub EVENT_TIMER {
	if ($timer eq "phase3") { 
		$check = 0;

		#phase4
		$check_boss = $entity_list->GetMobByNpcTypeID(223157);
		if ($check_boss) {
			$check = 1
		}
		#phase5
		$check_boss = $entity_list->GetMobByNpcTypeID(223158);
		if ($check_boss) {
			$check = 1
		}
		#quarm
		$check_boss = $entity_list->GetMobByNpcTypeID(223159);
		if ($check_boss) {
			$check = 1
		}	
		
		if($check == 0) {
    quest::shout("Phase 3 failed! Time expired.");
    quest::spawn_condition(potimeb,2,0); #set us to default.
    quest::spawn_condition(potimeb,3,0);
    quest::spawn_condition(potimeb,4,0);
    quest::spawn_condition(potimeb,5,0);
    quest::spawn_condition(potimeb,6,0);
    quest::spawn_condition(potimeb,7,0);
    quest::spawn_condition(potimeb,8,0);
    quest::spawn_condition(potimeb,9,0);
    quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
    quest::setglobal("timepokport",1,3,"M2");
    quest::stoptimer("phase3");
    quest::signalwith(223177,666,0);
    quest::depopall(223005); #depop any mobs up
    quest::depopall(223005);
    quest::depopall(223006); 
    quest::depopall(223026);
    quest::depopall(223027);
    quest::depopall(223028);
    quest::depopall(223029);
    quest::depopall(223030);
    quest::depopall(223033);
    quest::depopall(223034);
    quest::depopall(223035);
    quest::depopall(223036);
    quest::depopall(223039);
    quest::depopall(223040);
    quest::depopall(223041);
    quest::depopall(223042);
    quest::depopall(223043);
    quest::depopall(223044);
    quest::depopall(223045);
    quest::depopall(223048);
    quest::depopall(223049);
    quest::depopall(223052);
    quest::depopall(223053);
    quest::depopall(223054);
    quest::depopall(223055);
    quest::depopall(223056);
    quest::depopall(223059);
    quest::depopall(223060);
    quest::depopall(223061);
    quest::depopall(223062);
    quest::depopall(223063);
    quest::depopall(223064);
    quest::depopall(223067);
    quest::depopall(223068);
    quest::depopall(223069);
    quest::depopall(223070);
    quest::depopall(223071);
    quest::depopall(223072);
    quest::depopall(223009);
    quest::depopall(223008);
    quest::depopall(223024);
    quest::depopall(223025);
    quest::depopall(223031);
    quest::depopall(223032);
    quest::depopall(223037);
    quest::depopall(223038);
    quest::depopall(223046);
    quest::depopall(223047);
    quest::depopall(223050);
    quest::depopall(223051);
    quest::depopall(223058);
    quest::depopall(223057);
    quest::depopall(223066);
    quest::depopall(223065);
    quest::depopall(223074);
    quest::depopall(223073);
    quest::depopall(223010);
    quest::depopall(223011);
    quest::depopall(223012);
    quest::depopall(223013);
    quest::depopall(223014);
    quest::depopall(223015);
    quest::depopall(223016);
    quest::depopall(223017);
    quest::depopall(223018);
    quest::depopall(223019);
    quest::depopall(223020);
    quest::depopall(223021);
    quest::depopall(223022);
    quest::depopall(223023);
    quest::depopall(223155);
    quest::depopall(223156);
    quest::depopall(223217);
    quest::depopall(223218);
    quest::depopall(223219);
    quest::depopall(223220);
    quest::depopall(223221);
    quest::depopall(223222);
    quest::depopall(223223);
    quest::depopall(223224);
    quest::depop(); 
		} else {
			#new phase is running
			#we should start the timer for the next phase
			quest::stoptimer("phase3");
			quest::signalwith(223157,9909,0);
			quest::depop();
		}
	}

}