sub EVENT_ATTACK {
    if ($other->IsPet()) {
        quest::debug("Pet EVENT_ATTACK happened: " . $npc->GetCleanName() . " attacked " . $other->GetCleanName());
    }
        
}