sub EVENT_SPELL_EFFECT_CLIENT {
    if ($client->GetClassName() neq "Warrior") {
        $client->BuffFadeAll();
        quest::permaclass(1);
    } else {
        $client->Message(13, "Ability Failed. You are already a Warrior.");
    }
}