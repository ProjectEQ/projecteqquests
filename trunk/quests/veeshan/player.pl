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