sub EVENT_SAY {
    if ($text=~/hail/i) {
    } else ($text="warrior") {
        $client->BuffFadeAll();
        quest::permaclass(1);
    } else ($text="magician") {
        $client->BuffFadeAll();
        quest::permaclass(13);
    }
}