sub EVENT_DEATH_COMPLETE {
    quest::debug($npc->GetCleanName() . " was killed by " . $npc->GetHateListClients());
}