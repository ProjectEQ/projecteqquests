
sub EVENT_SAY {
    if ($text=~/Hail/i) {
        plugin::Whisper("A test subject! What would you like to " . quest::saylink("become", 1) . "?");
    } elsif ($text=~/Become/i) {
        plugin::RaceChanger("List");
    } else {
        plugin::RaceChanger($text);
    }
}