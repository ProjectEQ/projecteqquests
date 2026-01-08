# Primal Upgrader v1.2
# - Only upgrades to valid Primal items (base + 1,000,000)
# - Uses MySQL to confirm the Primal exists in the items table
# - Returns any items that don't have a Primal version

sub EVENT_SAY {
    if ($text =~ /hail/i) {
        quest::say("There is a hidden resonance in every piece of gear. By themselves, faint. In fours, the resonance amplifies and awakens. Hand me four of the same item, and I shall draw out the Primal essence—if such a form exists.");
    }
}

sub EVENT_ITEM {
    my $did_upgrade = 0;

    # Load database handle once
    my $dbh = plugin::LoadMysql();

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
