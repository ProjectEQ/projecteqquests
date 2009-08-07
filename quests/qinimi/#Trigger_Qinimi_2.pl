sub EVENT_SPAWN {
  $start_event = undef;
}

sub EVENT_SIGNAL {
if($signal == 1) { #signal 1 is from the Councilman Sislano
    $counter += 1;
    quest::depopall(281061);
    quest::depopall(281030);
    quest::starttimer(1,1620);
    quest::starttimer(2,600);
    $start_event = 1;
    spawn2(281129,0,0,-507,0,-8,193); #6 mastrqus
    spawn2(281129,0,0,-522,-35,-8,225);
    spawn2(281129,0,0,-557,-51,-8,253);
    spawn2(281129,0,0,-593,-35,-8,28);
    spawn2(281129,0,0,-607,0,-8,66);
    spawn2(281129,0,0,-593,35,-8,94);
        }
    
if($counter == 6) {     
   spawn2(281130,0,0,-557,50,-8,127); #3 nocs  3 ukuns
   spawn2(281130,0,0,-521,36,-8,166);
   spawn2(281130,0,0,-507,0,-8,193);
   spawn2(281128,0,0,-522,-35,-8,225);
   spawn2(281128,0,0,-593,-35,-8,28);
   spawn2(281128,0,0,-607,0,-8,66);
   
   }
   
if($counter == 12) {
   spawn2(281130,0,0,-557,50,-8,127); #3 nocs  3 ukuns
   spawn2(281130,0,0,-521,36,-8,166);
   spawn2(281130,0,0,-507,0,-8,193);
   spawn2(281128,0,0,-522,-35,-8,225);
   spawn2(281128,0,0,-593,-35,-8,28);
   spawn2(281128,0,0,-607,0,-8,66);
   }
   
if($counter == 18) {
  spawn2(281131,0,0,-557,50,-8,127);  #3 ra'tuk
  spawn2(281131,0,0,-521,36,-8,166);
  spawn2(281131,0,0,-507,0,-8,193);
  }
   

if($counter == 21) {
   quest::stoptimer(2);
   spawn2(281125,0,0,-556,0,-3,254);
   }
  
if($signal == 2) { #from death of Kabeka_Kret
   spawn2(281061,0,0,-507,0,-8,193);  #4 snakes
   spawn2(281061,0,0,-557,-51,-8,253);
   spawn2(281061,0,0,-607,0,-8,66);
   spawn2(281061,0,0,-557,50,-8,127);
   }
   
if($counter == 22) {
   spawn2(281126,0,0,-556,0,-3,254);   
   }

if($signal == 3) { #from death of Xictic
     quest::starttimer(3,360);
   }
   }
   
sub EVENT_TIMER {
  if ($timer == 1) {
     quest::stoptimer(1);
     $r = $client->GetRaid();
if($r)
{
   $r->TeleportRaid($npc, 281, 119,2063,554,356);
}
     quest::depopall(281128);
     quest::depopall(281129);
     quest::depopall(281130);
     quest::depopall(281061);
     quest::depopall(281126);
     quest::depopall(281125);
     $start_event = undef;
     }
     
   if ($timer == 2) {
     quest::stoptimer(2);
     spawn2(281030,0,0,-556,0,-3,254);
     }
     
   if ($timer == 3) {
     quest::stoptimer(3);
     $r = $client->GetRaid();
if($r)
{
   $r->TeleportRaid($npc, 281, 119,2063,554,356);
}
      $start_event = undef;
     quest::depop(281127);
     }
     }
     