# ===========================================================
# Bazaar Gate — v4.1 (Finalized Teleport Lock)
# Date: 2025-10-18 02:30 JST
# -----------------------------------------------------------
# • Teleports player from any zone to a fixed Bazaar location.
# • Saves their exact origin in data_buckets.
# • Casting again in Bazaar returns them to their original spot.
# ===========================================================

sub EVENT_SPELL_EFFECT_CLIENT {
    my $client = plugin::val('$client');
    return unless $client && $client->IsClient();

    my $zone_id = $client->GetZoneID();
    my $inst_id = $client->GetInstanceID();
    my $BAZAAR  = 151;
    my $now     = scalar localtime();

    # Fixed Bazaar destination
    my $bz_x = 35.39;
    my $bz_y = -807.07;
    my $bz_z = 3.75;
    my $bz_h = 443.00;

    # === Cast outside Bazaar ===
    if ($zone_id != $BAZAAR) {
        # Save coordinates before teleport
        $client->SetBucket("Return-Zone",     $zone_id);
        $client->SetBucket("Return-Instance", $inst_id);
        $client->SetBucket("Return-X",        $client->GetX());
        $client->SetBucket("Return-Y",        $client->GetY());
        $client->SetBucket("Return-Z",        $client->GetZ());
        $client->SetBucket("Return-H",        $client->GetHeading());

        $client->Message(263, "[BazaarGate v4.1][$now] Saved origin (Zone=$zone_id). Teleporting you to the Bazaar...");

        # Teleport to the fixed location in Bazaar
        $client->MovePC($BAZAAR, $bz_x, $bz_y, $bz_z, $bz_h);
        return;
    }

    # === Cast inside Bazaar (return) ===
    my $r_zone = $client->GetBucket("Return-Zone");
    my $r_inst = $client->GetBucket("Return-Instance");
    my $r_x    = $client->GetBucket("Return-X");
    my $r_y    = $client->GetBucket("Return-Y");
    my $r_z    = $client->GetBucket("Return-Z");
    my $r_h    = $client->GetBucket("Return-H");

    if (!defined $r_zone || $r_zone eq "") {
        $client->Message(13, "[BazaarGate v4.1][$now] No saved origin. Use this outside the Bazaar first.");
        return;
    }

    $client->Message(263, "[BazaarGate v4.1][$now] Returning to Zone=$r_zone...");

    if (defined $r_inst && $r_inst > 0) {
        $client->MovePCInstance($r_zone, $r_inst, $r_x, $r_y, $r_z, $r_h);
    } else {
        $client->MovePC($r_zone, $r_x, $r_y, $r_z, $r_h);
    }

    # Cleanup buckets after successful return
    foreach my $key (qw(Return-X Return-Y Return-Z Return-H Return-Zone Return-Instance)) {
        $client->DeleteBucket($key);
    }

    $client->Message(263, "[BazaarGate v4.1][$now] Cleanup complete.");
}
