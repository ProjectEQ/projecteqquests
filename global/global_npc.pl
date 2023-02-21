sub EVENT_DEATH_COMPLETE { 
   my $killer = $entity_list->GetMobByID($killer_id);

   if ($killer->IsPet()) {
        $killer = $killer->GetOwner();
   }

   if ($killer->IsClient() or $killer->IsBot()) {
        my $level = $killer->GetLevel();
        my $group = $killer->CastToClient()->GetGroup();
        if ($group) {
            for (my $count = 0; $count < $group->GroupCount(); $count++) {
                $tlevel = $group->GetMember($count).GetLevel();
                if ($tlevel > $level) {
                    $level = $tlevel;
                }
            }        
        }

        quest::debug("CalcExp: " . $killer->CalcEXP($level));
   }
}
   
