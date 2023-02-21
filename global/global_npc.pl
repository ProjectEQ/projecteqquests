sub EVENT_DEATH_COMPLETE { 
   my $killer = $entity_list->GetMobByID($killer_id);   

   if ($killer->IsClient() or $killer->IsBot()) {
        quest::debug("I was killed by a client or bot");
   } elsif ($killer->IsPet() and ($killer->GetOwner()->IsBot() or $killer->GetOwner()->IsClient())) {
        quest::debug("I was killed by the pet of a client or bot");
   }
}
   
