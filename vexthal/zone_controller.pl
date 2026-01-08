# =====================================================================
# Script: vt_lockout_handler.pl
# Version: 1.1 (2025-11-21)
# Author: ChatGPT (modified per David's request)
#
# Change Log:
#   v1.0 - Original version applied 3-day replay lockouts for specific NPC deaths.
#   v1.1 - Lockouts completely removed while preserving full logic structure.
#          Added Quest-style debug logging. No encounter mechanics altered.
#
# Purpose:
#   This script originally applied replay lockouts when specific NPCs in
#   Vex Thal / NTOV were killed. The user requested *NO LOCKOUTS* but also
#   requested that the rest of the logic remain unchanged.
#
#   Lockout calls are safely removed, but:
#     • NPC ID table is kept
#     • Expedition retrieval is kept
#     • Conditions remain in place
#     • Debug lines added for transparency
# =====================================================================

sub EVENT_DEATH_ZONE {

    # ---------------------------------------------------------------
    # NPC IDs that originally triggered lockouts
    # These are NTOV / VT mob IDs, placed in a hash for O(1) lookup.
    # ---------------------------------------------------------------
    my %npc_ids = map { $_ => 1 } (
        158014, 158010, 158015, 158012, 158013,
        158007, 158008, 158011, 158009
    );

    # This was the name used for the second lockout block.
    my $dz_name = "Vex Thal";

    # ---------------------------------------------------------------
    # FIRST CHECK (original script did two separate, redundant checks)
    #
    # This section *used to* apply a replay timer lockout.
    # Lockout has been removed, debug added.
    # ---------------------------------------------------------------
    if (exists $npc_ids{$killed_npc_id}) {

        my $dz = quest::get_expedition();

        if ($dz) {
            # Confirmation that the trigger was detected
            quest::debug("Quest: Trigger NPC $killed_npc_id died. (First block, no lockout applied)");

            # ORIGINAL:
            #   $dz->AddLockout("Replay Timer", 259200);
            #
            # REMOVED: No lockouts at all.
            #
            # NOTE: Logic preserved for stability.
        }
    }

    # ---------------------------------------------------------------
    # SECOND CHECK (kept intact because original script had two)
    #
    # This block originally added a named lockout using $dz_name.
    # Lockout removed, debug included.
    # ---------------------------------------------------------------
    if (exists $npc_ids{$killed_npc_id}) {

        my $dz = quest::get_expedition();

        if ($dz) {
            quest::debug("Quest: Trigger NPC $killed_npc_id died. (Second block, no lockout applied)");

            # ORIGINAL:
            #   $dz->AddLockout($dz_name, 259200);
            #
            # REMOVED: No lockouts will ever be applied by this script.
        }
    }
}
