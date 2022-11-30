sub EVENT_SPELL_EFFECT_CLIENT {
    my $mclass = $client->GetClass();
    if ($mclass==1) {
        $client->Message(13, "Ability Failed. You are already a Warrior.");
    } else {        
        $client->BuffFadeAll();
        quest::permaclass(1);
    }
}