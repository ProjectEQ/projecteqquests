sub EVENT_SAY {
    if ($text=~/hail/i) {
    } elsif ($text=~/warrior/i) {
        $client->BuffFadeAll();
        quest::permaclass(1);
    } elsif ($text=~/mage/i) {
        $client->BuffFadeAll();
        quest::permaclass(13);
    }
}