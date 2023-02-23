sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        $entity_list->GetMobByID($entity_id)->AddToHateList($npc->GetOwner());
    }        
}

sub EVENT_DAMAGE_TAKEN {
    
        $npc->ChangeSize($npc->GetSize());
        quest::debug("Attempting to reset Scaled Wolf Size");
}