my $Icounter;

sub EVENT_SPAWN {
    $Icounter = 0;
    quest::spawn_condition($zonesn,1,0); #set us to default.
    quest::spawn_condition($zonesn,2,0);
    quest::spawn_condition($zonesn,3,0);
    quest::spawn_condition($zonesn,4,0);
    quest::spawn_condition($zonesn,5,0);
    quest::spawn_condition($zonesn,6,0);
    quest::spawn_condition($zonesn,7,0);
    quest::spawn_condition($zonesn,8,0);
    quest::spawn_condition($zonesn,9,0);
    quest::spawn_condition($zonesn,10,0);
    quest::clearspawntimers(); # clear our timers so we spawn next time the phase occurs.
    quest::spawn2(223169,0,0,13.5,1632.4,492.3,0); #earth trigger
    quest::spawn2(223170,0,0,10.1,1350,492.6,0); #air trigger
    quest::spawn2(223171,0,0,18.0,1107,492.2,0); #undead trigger
    quest::spawn2(223172,0,0,11.5,857,492.5,0); #water trigger
    quest::spawn2(223173,0,0,13.2,574.2,492.3,0); #fire trigger
    quest::spawn2(223211,0,0,-140,1737,547,0); #phase 1 start
} 

sub EVENT_SIGNAL {
  if ($signal == 14060) {
    $Icounter += 1;
}
  if ($Icounter == 5 ) { #phase 1 success
    quest::spawn2(223191,0,0,-140,1737,547,0); #phase 2 trigger
    quest::stoptimer("phase1");
    $Icounter = 0;
}
  if ($signal == 33 ) {
    quest::settimer("phase1",3600); #phase 1 hour limit
    quest::setglobal("potb_p1_start",1,7,"H1"); #let potimea we've started.
    quest::signalwith(223111,1000,0); #flavor
}
  if ($signal == 666) { #one of our phases failed. reset.
    quest::delglobal("potb_p1_start");
    quest::delglobal("potb_p1_comp");
    quest::delglobal("potb_p2_comp");
    quest::delglobal("potb_p3_comp");
    quest::delglobal("potb_p4_comp");
    quest::delglobal("potb_p5_comp");
    quest::spawn2(223169,0,0,13.5,1632.4,492.3,0); #earth trigger
    quest::spawn2(223170,0,0,10.1,1350,492.6,0); #air trigger
    quest::spawn2(223171,0,0,18.0,1107,492.2,0); #undead trigger
    quest::spawn2(223172,0,0,11.5,857,492.5,0); #water trigger
    quest::spawn2(223173,0,0,13.2,574.2,492.3,0); #fire trigger
    quest::depopall(223160); #doors
    quest::depopall(223161);
    quest::depopall(223162);
    quest::depopall(223201);
    quest::depopall(223202);
    quest::depopall(223203);
    quest::depopall(223204);
    quest::depopall(223205);
    quest::depopall(223206);
    quest::depopall(223207);
    quest::depopall(223208);
    quest::depopall(223209);
    quest::depopall(223210);
    $Icounter = 0;
}
 if ($signal == 667) { #Quarm down
    quest::spawn2(223169,0,0,13.5,1632.4,492.3,0); #earth trigger
    quest::spawn2(223170,0,0,10.1,1350,492.6,0); #air trigger
    quest::spawn2(223171,0,0,18.0,1107,492.2,0); #undead trigger
    quest::spawn2(223172,0,0,11.5,857,492.5,0); #water trigger
    quest::spawn2(223173,0,0,13.2,574.2,492.3,0); #fire trigger
    quest::depopall(223160); #doors
    quest::depopall(223161);
    quest::depopall(223162);
    quest::depopall(223201);
    quest::depopall(223202);
    quest::depopall(223203);
    quest::depopall(223204);
    quest::depopall(223205);
    quest::depopall(223206);
    quest::depopall(223207);
    quest::depopall(223208);
    quest::depopall(223209);
    quest::depopall(223210);
    quest::depopall(223159);
    $Icounter = 0;
 }
 if ($signal == 802) { #we crashed, restarting phase 2.
    quest::depop(223169); #earth trigger
    quest::depop(223170); #air trigger
    quest::depop(223171); #undead trigger
    quest::depop(223172); #water trigger
    quest::depop(223173); #fire trigger
    quest::depop(223211); #phase 1 start
    quest::spawn2(223191,0,0,-140,1737,547,0); #phase 2 trigger
    quest::delglobal("potb_p1_comp");
    quest::setglobal("potb_p1_comp",1,7,"H1");
 }
 if ($signal == 803) { #we crashed, restarting phase 3.
    quest::depop(223169); #earth trigger
    quest::depop(223170); #air trigger
    quest::depop(223171); #undead trigger
    quest::depop(223172); #water trigger
    quest::depop(223173); #fire trigger
    quest::depop(223211); #phase 1 start
    quest::spawn2(223154,0,0,-140,1737,547,0); #phase 3 trigger
    quest::delglobal("potb_p2_comp");
    quest::setglobal("potb_p2_comp",1,7,"M75");
 }

 if ($signal == 804) { #we crashed, restarting phase 4.
    quest::depop(223169); #earth trigger
    quest::depop(223170); #air trigger
    quest::depop(223171); #undead trigger
    quest::depop(223172); #water trigger
    quest::depop(223173); #fire trigger
    quest::depop(223211); #phase 1 start
    quest::spawn2(223157,0,0,-410,-69,348,0); #spawn phase4_trigger
    quest::delglobal("potb_p3_comp");
    quest::setglobal("potb_p3_comp",1,7,"H4");
 }
 if ($signal == 805) { #we crashed, restarting phase 5.
    quest::depop(223169); #earth trigger
    quest::depop(223170); #air trigger
    quest::depop(223171); #undead trigger
    quest::depop(223172); #water trigger
    quest::depop(223173); #fire trigger
    quest::depop(223211); #phase 1 start
    quest::spawn2(223158,0,0,-415.5,-68.8,3.3,0); #phase 5 trigger
    quest::delglobal("potb_p4_comp");
    quest::setglobal("potb_p4_comp",1,7,"H4");
 }
  if ($signal == 806) { #we crashed, restarting phase 6.
    quest::depop(223169); #earth trigger
    quest::depop(223170); #air trigger
    quest::depop(223171); #undead trigger
    quest::depop(223172); #water trigger
    quest::depop(223173); #fire trigger
    quest::depop(223211); #phase 1 start
    quest::spawn2(223159,0,0,166,-938,9.7,0); #spawn quarm_trigger
    quest::delglobal("potb_p5_comp");
    quest::setglobal("potb_p5_comp",1,7,"H2");
 }
 if ($signal == 10) { #clock doors
    quest::forcedooropen(5);
    quest::forcedooropen(6);
    quest::forcedooropen(7);
    quest::forcedooropen(8);
    quest::forcedooropen(25);
    quest::forcedooropen(26);
    quest::forcedooropen(27);
    quest::forcedooropen(28);
    quest::forcedooropen(29);
    quest::forcedooropen(30);
    quest::forcedooropen(31);
    quest::forcedooropen(32);
    quest::forcedooropen(42);
    quest::forcedooropen(43);
    quest::forcedooropen(44);
    quest::forcedooropen(45);
    quest::forcedooropen(46);
    quest::forcedooropen(47);
    quest::forcedooropen(48);
    quest::forcedooropen(49);
  }
if ($signal == 18) { #clock doors
    quest::forcedooropen(13);
    quest::forcedooropen(14);
    quest::forcedooropen(15);
    quest::forcedooropen(16);
    quest::forcedooropen(33);
    quest::forcedooropen(34);
    quest::forcedooropen(35);
    quest::forcedooropen(36);
    quest::forcedooropen(38);
    quest::forcedooropen(39);
    quest::forcedooropen(40);
    quest::forcedooropen(41);
 }
}

sub EVENT_TIMER {
  if ($timer eq "phase1") { #event failure
    quest::shout("Phase 1 failed! Time expired.");
    quest::setglobal("timepokport",1,3,"M2");
    quest::depopall(223178);
    quest::depopall(223179);
    quest::depopall(223180);
    quest::depopall(223181);
    quest::depopall(223182);
    quest::depopall(223106);
    quest::depopall(223147);
    quest::depopall(223119);
    quest::depopall(223089);
    quest::depopall(223095);
    quest::depopall(223094);
    quest::depopall(223088);
    quest::depopall(223090);
    quest::depopall(223104);
    quest::depopall(223192);
    quest::depopall(223092);
    quest::depopall(223093);
    quest::depopall(223193);
    quest::depopall(223105);
    quest::depopall(223107);
    quest::depopall(223116);
    quest::depopall(223121);
    quest::depopall(223138);
    quest::depopall(223122);
    quest::depopall(223149);
    quest::depopall(223129);
    quest::depopall(223150);
    quest::depopall(223120);
    quest::depopall(223087);
    quest::depopall(223100);
    quest::depopall(223115);
    quest::depopall(223160); #doors
    quest::depopall(223161);
    quest::depopall(223162);
    quest::depopall(223201);
    quest::depopall(223202);
    quest::depopall(223203);
    quest::depopall(223204);
    quest::depopall(223205);
    quest::depopall(223206);
    quest::depopall(223207);
    quest::depopall(223208);
    quest::depopall(223209);
    quest::depopall(223210);
    quest::stoptimer("phase1");

}    
 }