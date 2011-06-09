sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_CLICKDOOR {
      
      $dragonsup = 0;

      #Xygoz
      $check = $entity_list->GetMobByNpcTypeID(108053);
      if ($check) {
         $dragonsup = 1;
      }

      #Druushk
      $check = $entity_list->GetMobByNpcTypeID(108040);
      if ($check) {
         $dragonsup = 1;
      }
      
      #Nexona
      $check = $entity_list->GetMobByNpcTypeID(108047);
      if ($check) {
         $dragonsup = 1;
      }

      #Hoshkar
      $check = $entity_list->GetMobByNpcTypeID(108043);
      if ($check) {
         $dragonsup = 1;
      }

      #Silverwing
      $check = $entity_list->GetMobByNpcTypeID(108050);
      if ($check) {
         $dragonsup = 1;
      }     
 if(($doorid == 56 || $doorid == 57 || $doorid == 312 || $doorid == 313) && ($dragonsup == 0)) {
  $client->Message(0,"You got the door open.");
  quest::forcedooropen(56);
  quest::forcedooropen(57);
 }
 elsif($doorid == 56 || $doorid == 57 || $doorid == 312 || $doorid == 313) {
  $client->Message(0,"A seal has been placed on this door by Phara Dar. Perhaps there is a way to remove 
it.");
 }
}