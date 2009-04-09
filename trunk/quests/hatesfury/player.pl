sub EVENT_CLICKDOOR {
   
   if(($doorid == 3 || $doorid == 259) && ($entity_list->GetMobByNpcTypeID(228119) || $entity_list->GetMobByNpcTypeID(228120))){
            $client->Message(0,"You got the door open.");
            quest::movepc(228,-1066,-48,-284,380);
   }
   if(($doorid == 4 || $doorid == 260) && ($entity_list->GetMobByNpcTypeID(228119) || $entity_list->GetMobByNpcTypeID(228120))){
            $client->Message(0,"You got the door open.");
            quest::movepc(228,-1360,-290,74,128);
   }
}