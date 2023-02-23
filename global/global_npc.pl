sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        $entity_list->GetMobByID($entity_id)->AddToHateList($npc->GetOwner());
    }        
}

sub EVENT_DAMAGE_TAKEN {
    if ($npc->GetRace() == 356) {
        $npc->ChangeSize($npc->GetSize());
        quest::debug("Attempting to reset Scaled Wolf Size");
    }
}