# Franklin_Teek.pl — Minimal Hotzone Announcer + XP Mod
# NPCID: 202449
# Lists zones where zone.hotzone = 1 and shows each zone's XP modifier.
# Auto-detects which XP column your schema uses.

my $DEBUG = 1;   # 1 = console debug on, 0 = off
my $XP_COL;      # detected XP column name cached after first hail

sub EVENT_SAY {
    return unless ($text =~ /hail/i or $text =~ /hotzone/i);

    my $dbh = plugin::LoadMysql();
    if (!$dbh) {
        plugin::Whisper("I can't access my records right now.");
        if ($DEBUG) { quest::debug("Teek: DB connect failed."); }
        return;
    }

    # Detect XP modifier column once and cache the name
    if (!$XP_COL) {
        my @candidates = ('exp_multiplier','experience_multiplier','zone_exp_multiplier','exp_mod');
        my $placeholders = join(",", map { "?" } @candidates);
        my $sth_cols = $dbh->prepare(qq{
            SELECT COLUMN_NAME
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = DATABASE()
              AND TABLE_NAME = 'zone'
              AND COLUMN_NAME IN ($placeholders)
            LIMIT 1
        });
        $sth_cols->execute(@candidates);
        ($XP_COL) = $sth_cols->fetchrow_array();
        $sth_cols->finish();
        if ($DEBUG) {
            quest::debug("Teek: Detected XP column: " . ($XP_COL // 'NONE'));
        }
    }

    my $select_xp = $XP_COL ? $XP_COL : '1.0';  # fallback to 1.0 if none
    my $query = qq{
        SELECT short_name, long_name, $select_xp AS xpmod
        FROM zone
        WHERE hotzone = 1
        ORDER BY id
    };

    my $sth = $dbh->prepare($query);
    if (!$sth->execute()) {
        plugin::Whisper("Hmm... my records are unavailable.");
        if ($DEBUG) { quest::debug("Teek: SQL execution failed: $query"); }
        return;
    }

    my @lines;
    while (my ($short, $long, $xpmod) = $sth->fetchrow_array()) {
        # format to xY.YY
        my $fmt = sprintf("x%.2f", $xpmod // 1.0);
        push @lines, " - $long ($short) — XP $fmt";
    }
    $sth->finish();

    if (@lines) {
        plugin::Whisper("The current hotzones are:");
        foreach my $ln (@lines) { plugin::Whisper($ln); }
        if ($DEBUG) { quest::debug("Teek: Listed " . scalar(@lines) . " hotzones."); }
    } else {
        plugin::Whisper("There are currently no active hotzones.");
        if ($DEBUG) { quest::debug("Teek: No hotzones found."); }
    }
}
