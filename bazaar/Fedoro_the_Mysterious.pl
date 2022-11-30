sub EVENT_SAY {
    if ($text=~/hail/i) {
    } elsif ($text="warrior") {
        $client->BuffFadeAll();
        quest::permaclass(1);
    } elsif ($text="magician") {
        $client->BuffFadeAll();
        quest::permaclass(13);
    }
}