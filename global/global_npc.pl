sub EVENT_DEATH_COMPLETE { 
   my $killer = $entity_list->GetMobByID($killer_id);

   if ($killer->IsPet()) {
        $killer = $killer->GetOwner();
   }

   if ($killer->IsClient() or $killer->IsBot()) {
        my $level = $killer->GetLevel();
        quest::debug("My killer's level is: " . $level);
   }

}
   
