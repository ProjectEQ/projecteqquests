sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SIGNAL {
   if($signal == 0) { #signal 0 is from the Councilman Sislano
      quest::depopall(281061);
      quest::depopall(281030);
      quest::settimer(1,1620);  #event timer
      quest::settimer(2,600);   #spawn timer for mass of stone
      quest::spawn2(281129,0,0,-507,0,-8,193); #6 mastrqus
      quest::spawn2(281129,0,0,-522,-35,-8,225);
      quest::spawn2(281129,0,0,-557,-51,-8,253);
      quest::spawn2(281129,0,0,-593,-35,-8,28);
      quest::spawn2(281129,0,0,-607,0,-8,66);
      quest::spawn2(281129,0,0,-593,35,-8,94);
   }

   if($signal == 1) {
      $counter += 1;
   }
   
   if($counter == 6) {     
      quest::spawn2(281130,0,0,-557,50,-8,127); #3 nocs  3 ukuns
      quest::spawn2(281130,0,0,-521,36,-8,166);
      quest::spawn2(281130,0,0,-507,0,-8,193);
      quest::spawn2(281128,0,0,-522,-35,-8,225);
      quest::spawn2(281128,0,0,-593,-35,-8,28);
      quest::spawn2(281128,0,0,-607,0,-8,66);
   }
   
   if($counter == 12) {
      quest::spawn2(281130,0,0,-557,50,-8,127); #3 nocs  3 ukuns
      quest::spawn2(281130,0,0,-521,36,-8,166);
      quest::spawn2(281130,0,0,-507,0,-8,193);
      quest::spawn2(281128,0,0,-522,-35,-8,225);
      quest::spawn2(281128,0,0,-593,-35,-8,28);
      quest::spawn2(281128,0,0,-607,0,-8,66);
   }
   
   if($counter == 18) {
      quest::spawn2(281131,0,0,-557,50,-8,127);  #3 ra'tuk
      quest::spawn2(281131,0,0,-521,36,-8,166);
      quest::spawn2(281131,0,0,-507,0,-8,193);
   }   

   if($counter == 21) {
      quest::stoptimer(2);
      quest::spawn2(281125,0,0,-556,0,-3,254);
   }
 
   if($signal == 2) { #from death of Kabeka_Kret
      quest::spawn2(281061,0,0,-507,0,-8,193);  #4 snakes
      quest::spawn2(281061,0,0,-557,-51,-8,253);
      quest::spawn2(281061,0,0,-607,0,-8,66);
      quest::spawn2(281061,0,0,-557,50,-8,127);
   }
   
   if($counter == 26) {
      quest::spawn2(281126,0,0,-556,0,-3,254);   
   }

   if($signal == 3) { #from death of Xictic
     quest::settimer(3,600);
   }
}
   
sub EVENT_TIMER {
  if ($timer == 1) {
     quest::stoptimer(1);
     quest::signalwith(281051,1,0);  #signal to remove on failure
     quest::depopall(281128);
     quest::depopall(281129);
     quest::depopall(281130);
     quest::depopall(281061);
     quest::depopall(281126);
     quest::depopall(281125);
  }
     
   if ($timer == 2) {
     quest::stoptimer(2);
     quest::spawn2(281030,0,0,-556,0,-3,254);
     }
     
   if ($timer == 3) {
     quest::stoptimer(3);
     quest::signalwith(281051,1,0);  #signal to remove on success
     quest::depop(281127);
     }
}