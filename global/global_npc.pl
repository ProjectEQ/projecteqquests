sub EVENT_ATTACK {
    if ($npc->IsPet()) {
        quest::debug("Pet EVENT_ATTACK happened: " . $npc->GetCleanName() . " attacked " . $other->GetCleanName());
    }
        
}