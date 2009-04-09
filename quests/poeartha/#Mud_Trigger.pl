#Mud RING
sub EVENT_SPAWN {
     quest::settimer("mud",1);
     $counter=0;
     $countertwo=0;
     }
sub EVENT_TIMER {
    {
    quest::stoptimer("mud");
    quest::settimer("mud",1);
    $check=0;
    }
    if ($timername == "mud") {
    $check_boss = $entity_list->GetMobByNpcTypeID(218013); 
        if ($check_boss) {
          $check = 1
        }
    if($check == 0 && $mud_ring == undef && $mud_ring_run == undef) {
      quest::spawn2(218070,0,0,340,90,70.5,127.1);
      quest::setglobal(mud_ring_run,1,3,"H3");
      $counter=0;
      $countertwo=0;
      $check=0;
      }
 } 
}
sub EVENT_SIGNAL {
 if($signal == 1) { #mud ring
   $counter += 1;
     if($counter == 10 && $mud_ring == undef && $mud_ring_run == 1 && $wavecount == 0) {		quest::spawn2(218070,0,0,340,90,70.5,127.1);		$wavecount+=1;		$counter=0;
       }
     elsif($counter == 10 && $mud_ring == undef && $mud_ring_run == 1 && $wavecount == 1) { 		quest::spawn2(218070,0,0,340,90,70.5,127.1);		$wavecount+=1;		$counter=0;
       }
     elsif($counter == 10 && $mud_ring == undef && $mud_ring_run == 1 && $wavecount == 2) { 		quest::spawn2(218070,0,0,340,90,70.5,127.1);		$wavecount+=1;		$counter=0;
       }
     elsif($counter == 10 && $mud_ring == undef && $mud_ring_run == 1 && $wavecount == 3) { 
       quest::spawn2(218095,0,0,340,90,70.5,127.1);		$wavecount=0;
       $counter=0;
       }
  }
 if($signal == 2) { #mud ring
   $countertwo += 1;
     if($countertwo == 4 && $mud_ring == undef && $mud_ring_run == 1) {
       quest::spawn2(218050,0,0,340,90,70.5,127.1);
       $countertwo=0;
       }
 }
 if($signal == 3) { #mud final
   $mud_ring_run=undef;
   $mud_ring=undef;
   quest::setglobal(mud_ring,1,3,"D4");
 }
}

