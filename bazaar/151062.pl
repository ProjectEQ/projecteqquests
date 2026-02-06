# Primal Upgrader v1.4.3
# - 4x of the same item upgrades to Primal (base + 1,000,000) if the Primal exists in DB
# - Uses MySQL to confirm the Primal exists in the items table
# - Returns any items that don't have a Primal version
# - Quarm's Essence (ID 300000) + exactly 1 item (2-slot hand-in) => Ancient
#   * Base (<1,000,000) -> Ancient (base + 2,000,000)
#   * Primal (1,000,000-1,999,999) -> Ancient (primal + 1,000,000)
# - If anything fails in the Essence path: returns ALL items
#
# CHANGE LOG
# [v1.4]   Switched Essence detection/validation to use $item1..$item4 slot inspection for reliability.
#          Updated hail text to mention Quarm's Essence Ancient upgrade route.
# [v1.4.1] Attempted quest::takeitems() to prevent duping; not supported by this Perl API.
# [v1.4.2] Removed charge checks; enforced "Essence + 1 item" by requiring exactly 2 filled slots.
# [v1.4.3] FIX: Removed quest::takeitems() (undefined). Consume Essence + item via plugin::check_handin() instead.

my $QUARMS_ESSENCE_ID = 300000;

sub EVENT_SAY {
    if ($text =~ /hail/i) {
        quest::say(
            "There is a hidden resonance in every piece of gear. By themselves, faint. In fours, the resonance amplifies and awakens. "
            . "Hand me four of the same item, and I shall draw out the Primal essence—if such a form exists. "
            . "If you possess " . quest::varlink($QUARMS_ESSENCE_ID) . ", bring me the Essence and a single item (only two things in your trade) to awaken its Ancient form at once."
        );
    }
}

sub EVENT_ITEM {
    my $did_upgrade = 0;

    # Load database handle once
    my $dbh = plugin::LoadMysql();

    # ------------------------------------------------------------
    # STRICT Quarm's Essence + exactly 1 item => Ancient (slot-based)
    # Return all on any failure.
    # Consume on success using plugin::check_handin() (quest::takeitems not available on this server).
    # ------------------------------------------------------------

    my @slots = ($item1, $item2, $item3, $item4);

    # Present slot indexes
    my @present_idx;
    for (my $i = 0; $i < 4; $i++) {
        push @present_idx, $i if ($slots[$i] && $slots[$i] > 0);
    }

    # Is Essence present in any filled slot?
    my @ess_idx = grep { $slots[$_] == $QUARMS_ESSENCE_ID } @present_idx;

    if (@ess_idx) {

        # Must be exactly two filled slots: Essence + one other item
        if (scalar(@present_idx) != 2 || scalar(@ess_idx) != 1) {
            quest::say("The resonance rejects this offering. Hand me ONLY two things: one Quarm's Essence and one single item.");
            plugin::return_items(\%itemcount);
            return;
        }

        my $ess_slot = $ess_idx[0];
        my ($item_slot) = grep { $_ != $ess_slot } @present_idx;

        my $src_id = $slots[$item_slot];
        if (!$src_id || $src_id <= 0) {
            quest::say("The resonance rejects this offering. I could not identify the item you wish to elevate.");
            plugin::return_items(\%itemcount);
            return;
        }

        # Compute Ancient target ID
        my $ancient_id = 0;

        if ($src_id < 1000000) {
            # Base -> Ancient
            $ancient_id = $src_id + 2000000;
        }
        elsif ($src_id >= 1000000 && $src_id < 2000000) {
            # Primal -> Ancient
            $ancient_id = $src_id + 1000000;
        }
        else {
            quest::say("That item already bears an Ancient resonance. I cannot elevate it further.");
            plugin::return_items(\%itemcount);
            return;
        }

        # Confirm Ancient exists in DB
        my $sth = $dbh->prepare("SELECT id FROM items WHERE id = ?");
        $sth->execute($ancient_id);
        my ($found_ancient) = $sth->fetchrow_array();

        if (!$found_ancient) {
            quest::say(
                "I searched for the Ancient form and found nothing. "
                . "Source: " . quest::varlink($src_id)
                . " -> Expected Ancient: " . quest::varlink($ancient_id)
                . ". I will return your offering unchanged."
            );
            plugin::return_items(\%itemcount);
            return;
        }

        # Consume inputs (works on this server) then award
        if (!plugin::check_handin(\%itemcount, $QUARMS_ESSENCE_ID => 1, $src_id => 1)) {
            # This should be rare since we validated slots, but keeps "return all on fail"
            quest::say("The Essence resists the exchange. I will return your offering unchanged.");
            plugin::return_items(\%itemcount);
            return;
        }

        quest::say("Quarm's Essence flares—your item is reborn in its Ancient state.");
        quest::summonitem($ancient_id);

        # IMPORTANT: Do not return items on success (check_handin removed them from %itemcount)
        return;
    }

    # ------------------------------------------------------------
    # Existing 4x => Primal logic (original flow)
    # ------------------------------------------------------------

    # Snapshot of hand-in IDs so we don't fight %itemcount mutations
    my @handin_ids = keys %itemcount;

    foreach my $item_id (@handin_ids) {
        my $count = $itemcount{$item_id} || 0;
        next if $count < 4;  # need at least 4 of a kind

        my $primal_id = $item_id + 1000000;

        # Check if the Primal row actually exists in the items table
        my $sth = $dbh->prepare("SELECT id FROM items WHERE id = ?");
        $sth->execute($primal_id);
        my ($found_id) = $sth->fetchrow_array();

        if (!$found_id) {
            # Primal doesn't exist for this base item, don't consume these
            quest::say(
                "I sense no Primal resonance for "
                . quest::varlink($item_id)
                . ". I cannot reforge this one, so I will return it unchanged."
            );
            next;
        }

        # Handle multiple sets (4, 8, 12, etc.)
        my $sets = int($count / 4);
        for (my $i = 0; $i < $sets; $i++) {
            # This will actually consume 4x of $item_id if present
            if (plugin::check_handin(\%itemcount, $item_id => 4)) {
                quest::say("Your item has been reforged into its Primal state.");
                quest::summonitem($primal_id);
                $did_upgrade = 1;
            }
        }
    }

    if (!$did_upgrade) {
        quest::say("These are not the items I require, or no Primal forms exist for them.");
    }

    # Return anything not consumed by successful upgrades
    plugin::return_items(\%itemcount);
}
