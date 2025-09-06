sub EVENT_SAY {
    my $player_name = $client->GetCleanName();
    my $charid = $client->CharacterID();

    if ($text=~/hail/i) {
        plugin::Whisper("Greetings, $player_name. I can remove all of your expedition lockouts. Do you wish me to proceed? [yes] or [no]");
    }
    elsif ($text=~/yes/i) {
        my $rows1 = quest::db_execute_rows("DELETE FROM expedition_lockouts WHERE charid = $charid");
        my $rows2 = quest::db_execute_rows("DELETE FROM dz_lockouts WHERE charid = $charid");
        my $total = $rows1 + $rows2;

        if ($total > 0) {
            plugin::Whisper("Very well, $player_name. Your $total lockouts have been cleared.");
        } else {
            plugin::Whisper("Very well, $player_name. You didn’t have any lockouts to clear.");
        }
    }
    elsif ($text=~/no/i) {
        plugin::Whisper("Very well, $player_name. I will leave your lockouts unchanged.");
    }
}
