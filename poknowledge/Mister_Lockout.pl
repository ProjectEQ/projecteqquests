sub EVENT_SAY {
    if ($text=~/hail/i && $client->GetGM()) { 
        quest::debug("Attempting to give you dual weild");
        $client->AddSkill(22, 100);
    }
}