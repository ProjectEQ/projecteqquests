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
 if($doorid == 37 || $doorid == 293) {
  quest::forcedooropen(40);
 }
 if($doorid == 40 || $doorid == 296) {
  quest::forcedooropen(37);
 }
 if($doorid == 59 || $doorid == 315) {
  quest::forcedooropen(60);
 }
 if($doorid == 60 || $doorid == 316) {
  quest::forcedooropen(59);
 }
 if($doorid == 77 || $doorid == 333) {
  quest::forcedooropen(78);
 }
 if($doorid == 78 || $doorid == 334) {
  quest::forcedooropen(77);
 }
 if($doorid == 109 || $doorid == 365) {
  quest::forcedooropen(110);
 }
 if($doorid == 110 || $doorid == 366) {
  quest::forcedooropen(109);
 }
 if($doorid == 112 || $doorid == 368) {
  quest::forcedooropen(114);
 }
 if($doorid == 114 || $doorid == 370) {
  quest::forcedooropen(112);
 }
 if($doorid == 118 || $doorid == 374) {
  quest::forcedooropen(119);
 }
 if($doorid == 119 || $doorid == 375) {
  quest::forcedooropen(118);
 }
 if($doorid == 121 || $doorid == 377) {
  quest::forcedooropen(122);
 }
 if($doorid == 122 || $doorid == 378) {
  quest::forcedooropen(121);
 }
 if($doorid == 127 || $doorid == 383) {
  quest::forcedooropen(128);
 }
 if($doorid == 128 || $doorid == 384) {
  quest::forcedooropen(127);
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