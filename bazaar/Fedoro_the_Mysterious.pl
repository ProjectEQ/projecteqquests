# Class-Change NPC
# Characters use 'CharID-Class-Unlocks-Available'

sub EVENT_SAY {
    if ($text=~/debug/i) {
        $client->GrantAlternateAdvancementAbility(30196, 1);
        $client->GrantAlternateAdvancementAbility(30203, 1);
        $client->GrantAlternateAdvancementAbility(30210, 1);
        $client->GrantAlternateAdvancementAbility(30211, 1);
        $client->GrantAlternateAdvancementAbility(30197, 1);
        $client->GrantAlternateAdvancementAbility(30201, 1);
        $client->GrantAlternateAdvancementAbility(30209, 1);
        $client->GrantAlternateAdvancementAbility(30208, 1);
        $client->GrantAlternateAdvancementAbility(30202, 1);
        $client->GrantAlternateAdvancementAbility(30206, 1);
        $client->GrantAlternateAdvancementAbility(30198, 1);
        $client->GrantAlternateAdvancementAbility(30199, 1);
        $client->GrantAlternateAdvancementAbility(30204, 1);
        $client->GrantAlternateAdvancementAbility(30200, 1);
        $client->GrantAlternateAdvancementAbility(30205, 1);
        $client->GrantAlternateAdvancementAbility(30207, 1);
    }
}