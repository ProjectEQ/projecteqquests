sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        quest::debug("Pet EVENT_DAMAGE_GIVEN happened: " . $npc->GetCleanName());
    }
        
}