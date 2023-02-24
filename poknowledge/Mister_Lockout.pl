sub EVENT_SAY {
    if ($text=~/hail/i && $client->GetGM()) { 
        $client->AddSkill(22, 100);
    }
}