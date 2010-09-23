sub EVENT_SPAWN {
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
  $event = 0; 
}

sub EVENT_ENTER {
  if(($event == 0) && ($qglobals{tipt_progress} == undef)) {
   quest::spawn2(289034,0,0,-2106,188,250,78);
   quest::spawn2(289034,0,0,-2075,246,250,120);
   quest::spawn2(289034,0,0,-2019,247,250,103);
   quest::spawn2(289034,0,0,-1945,257,250,143);
   quest::spawn2(289034,0,0,-1895,196,250,167);
   quest::spawn2(289034,0,0,-1865,140,250,213);
   quest::spawn2(289034,0,0,-1953,94,250,222);
   quest::spawn2(289034,0,0,-2047,125,250,22);
   quest::setglobal("tipt_progress",1,5,"H6");
   $event = 1;
   }
   }
   
sub EVENT_SIGNAL {
  if($signal == 1) {   #from cragbeast hatchling and 289002
    $counter +=1;
    }
  if($counter == 8) {
    quest::spawn2(289036,0,0,-2040,196,250,113);
}
 } 
