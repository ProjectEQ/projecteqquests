sub EVENT_DEATH_COMPLETE {
   

   my $killer = $entity_list->GetMobByID($killer_id);

   if ($killer->IsClient() or $kill->IsBot()) {
        my $level = $killer->GetLevel();
        if ($killer->GetGroup()) {
            for (my $count = 0; $count < $killer->GetGroup()->GroupCount(); $count++) {                
                if ($killer->GetGroup()->GetMember($count)->GetLevel() > $level) {
                    $level = $killer->GetGroup()->GetMember($count)->GetLevel();
                }
            }
        }
   } elsif ($killer->IsPet() and ($killer->GetOwner()->IsClient() or $killer->GetOwner()->IsBot())) {
        if ($killer->GetOwner()->GetGroup()) {
            for (my $count = 0; $count < $killer->GetOwner()->GetGroup()->GroupCount(); $count++) {
                if ($killer->GetOwner()->GetGroup()->GetMember($count)->GetLevel() > $level) {
                    $level = $killer->GetOwner()->GetGroup()->GetMember($count)->GetLevel();
                }
            }
        }
   }

    quest::debug("My Highest Level Killer Was: " . $level);
}