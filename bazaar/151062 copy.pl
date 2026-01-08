sub EVENT_SAY {
    if ($text=~/hail/i) {
        quest::say("There is a hidden resonance in every piece of gear. By themselves, faint. In fours, the resonance amplifies and awakens. Hand me four, and I shall draw out the Primal essence within.");
    }
}

sub EVENT_ITEM {
    # Loop through all items handed in
    foreach my $item_id (keys %itemcount) {
        if (plugin::check_handin(\%itemcount, $item_id => 4)) {
            my $primal_id = $item_id + 1000000;   # Generate Primal version
            quest::say("Your item has been reforged into its Primal state.");
            quest::summonitem($primal_id);        # Give Primal version
            return;
        }
    }

    quest::say("These are not the items I require.");
    plugin::return_items(\%itemcount);
}
