sub EVENT_SAY {
    if ($text=~/hail/i) {
    } elsif ($text="warrior") {
        $client->BuffFadeAll();
        quest::permaclass(1);
    } elsif ($text="mage") {
        $client->BuffFadeAll();
        quest::permaclass(2);
    }
}