sub EVENT_SPELL_EFFECT_CLIENT {
    quest::debug("started warrior class change");
    if ($client->GetClassName() neq "Warrior") {
        $client->BuffFadeAll();
        quest::permaclass(1);
    } else {
        $client->Message(13, "Ability Failed. You are already a Warrior.");
    }
    quest::debug("Completed warrior class change");
}