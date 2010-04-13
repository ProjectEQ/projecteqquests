sub EVENT_SPAWN {
  $counter=0;
  quest::spawn_condition($zonesn,1,0);
  quest::settimer(1,120);

}

sub EVENT_TIMER {
   quest::spawn_condition($zonesn,1,1);

}

sub EVENT_SIGNAL {
  if($signal == 1) { 
         $counter += 1;
}
  if($counter == 8 ) {			
   quest::spawn_condition($zonesn,1,1);
}
  if($counter == 16 ) {			
   quest::spawn_condition($zonesn,1,1);
}
 if($counter == 24 ) {			
   quest::spawn_condition($zonesn,1,1);
}
 if($counter == 32 ) {			
   quest::spawn_condition($zonesn,1,1);
}
 if($counter == 40 ) {			
   quest::spawn_condition($zonesn,1,2);
}
 if($counter == 48 ) {			
    quest::spawn2(206080,0,0,-289,-760,2,250);
}
}