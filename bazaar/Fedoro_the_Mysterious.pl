# Class-Change NPC
# Characters use 'CharID-Class-Unlocks-Available'

sub EVENT_SAY {
    if ($text=~/hail/i) {
        $client->GrantAlternateAdvancementAbility(481, 1);
    }
}