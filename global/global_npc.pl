sub EVENT_DEATH_COMPLETE { 
   my $killer = $entity_list->GetMobByID($killer_id);

   quest::debug("I was killed by " . $killer->GetCleanName());
}
   
