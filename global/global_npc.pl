sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        $entity_list->GetMobByID($entity_id)->AddToHateList($npc->GetOwner());
    }        
}

sub EVENT_DAMAGE_TAKEN {
    if ($npc->GetRace() == 42) {
        quest::debug("Attempting to reset Scaled Wolf Size: " . $npc->GetSize() . ":" . $npc->GetBaseSize());
        quest::debug("My Race is: " . $npc->GetRace(). " My Name is: " . $npc->GetCleanName());
        $npc->ChangeSize($npc->GetBaseSize(), 1);
    }
}