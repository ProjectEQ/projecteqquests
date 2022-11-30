sub EVENT_SPELL_EFFECT_CLIENT {
    $client->BuffFadeAll();
    quest::permaclass(1);
    quest::debug("APPLIED");
}