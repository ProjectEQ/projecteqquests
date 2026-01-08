###############################################
# NPC: Lockout Oracle (Global Lockout Doctor)
# Version 1.4 - 2025-11-24
#
# Behavior:
#   - ANY PLAYER can use this NPC.
#   - "hail"      -> explains function + shows clickable [normalize] link.
#   - "normalize" -> clamps ALL rows in character_expedition_lockouts so
#                   no lockout exceeds 9 hours.
#
# Summary:
#   This script enforces the global server rule:
#     "No lockout shall ever exceed 9 hours."
###############################################

my $SCRIPT_VERSION = "1.4";
my $MAX_HOURS      = 9;
my $MAX_SECONDS    = $MAX_HOURS * 3600;

sub EVENT_SAY {

    ###############################################
    # GREETING — show clickable normalize link
    ###############################################
    if ($text =~ /hail/i) {
        my $normalize_link = quest::saylink("normalize", 1);

        quest::say(
            "Greetings, $name." .
            "I can normalize ALL expedition lockouts on this server so that no timer " .
            "exceeds $MAX_HOURS hours. Click [$normalize_link] to apply this."
        );
        return;
    }

    ###############################################
    # NORMALIZE (GLOBAL – ANYONE CAN USE)
    ###############################################
    if ($text =~ /normalize/i) {

        quest::say("Loading database handle...");

        # Load DB connection using EQEmu's built-in plugin
        my $dbh = plugin::LoadMysql();
        if (!$dbh) {
            quest::say("Failed to obtain database handle.");
            return;
        }

        ###############################################
        # Step 1: Count rows violating the 9-hour rule
        ###############################################
        my $count_sql = qq{
            SELECT COUNT(*) AS cnt
            FROM character_expedition_lockouts
            WHERE duration > $MAX_SECONDS
               OR TIMESTAMPDIFF(SECOND, NOW(), expire_time) > $MAX_SECONDS
        };

        my $count = 0;
        my $sth1  = $dbh->prepare($count_sql);

        if ($sth1 && $sth1->execute()) {
            if (my $row = $sth1->fetchrow_hashref()) {
                $count = $row->{cnt} || 0;
            }
            $sth1->finish();
        } else {
            quest::say("Failed to count lockouts: " . ($dbh->errstr || "unknown error"));
            $dbh->disconnect();
            return;
        }

        if ($count == 0) {
            quest::say("All expedition lockouts already comply with the ${MAX_HOURS}-hour limit.");
            $dbh->disconnect();
            return;
        }

        quest::say("Found $count lockout record(s) exceeding ${MAX_HOURS}h. Normalizing...");

        ###############################################
        # Step 2: Global clamp on ANY rows > 9 hours
        ###############################################
        my $update_sql = qq{
            UPDATE character_expedition_lockouts
            SET
                duration = CASE
                    WHEN duration > $MAX_SECONDS THEN $MAX_SECONDS
                    ELSE duration
                END,
                expire_time = CASE
                    WHEN TIMESTAMPDIFF(SECOND, NOW(), expire_time) > $MAX_SECONDS
                    THEN DATE_ADD(NOW(), INTERVAL $MAX_SECONDS SECOND)
                    ELSE expire_time
                END
            WHERE duration > $MAX_SECONDS
               OR TIMESTAMPDIFF(SECOND, NOW(), expire_time) > $MAX_SECONDS
        };

        my $sth2 = $dbh->prepare($update_sql);
        my $rows = 0;

        if ($sth2 && $sth2->execute()) {
            $rows = $sth2->rows;
            $sth2->finish();
        } else {
            quest::say("Failed to update lockouts: " . ($dbh->errstr || "unknown error"));
            $dbh->disconnect();
            return;
        }

        $dbh->disconnect();

        ###############################################
        # Step 3: Report result
        ###############################################
        quest::say(
            "Normalization complete. " .
            "Rows needing correction: $count. Rows updated: $rows. " .
            "No expedition lockout now exceeds $MAX_HOURS hours."
        );
    }
}
