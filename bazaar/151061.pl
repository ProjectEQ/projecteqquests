my %epics = (
        5532   => "Water Sprinkler of Nem Ankh", # Cleric
        1683   => "Celestial Fists",             # Monk
        20488  => "Earthcaller",                 # Ranger
        20487  => "Swiftwind",                   # Ranger alt
        10099  => "Fiery Defender",              # Paladin
        6640   => "Baton of Faith",              # Paladin alt
        5504   => "SoulFire",                    # Paladin pre-epicd
        5127   => "Greenmist",                   # Shadowknight
        14383  => "Innoruuk's Curse",            # Shadowknight alt
        20544  => "Scythe of the Shadowed Soul", # Necromancer
        20542  => "Singing Short Sword",         # Bard
        10650  => "Staff of the Serpent",        # Enchanter
        28034  => "Orb of Mastery",              # Magician
        66177  => "Blade of Strategy",           # Warrior
        66176  => "Blade of Tactics",            # Warrior
        66175  => "Jagged Blade of War",         # Warrior
        68299  => "Kerasian Axe of Ire",         # Berserker Epic
        10651  => "Spear of Fate",               # Shaman Epic
        11057  => "Ragebringer",                 # Rogue Epic       
        10652  => "Celetial fists",              # Monk Epic
        8495  => "Claw of the Savage Spirit",    # Beastlord Epic  
        8496  => "Claw of the Savage Spirit",    # Beastlord Epic

        # Add missing epics here if you want ALL classes supported
);

sub EVENT_SAY {
    if ($text=~/hail/i) {
        plugin::Whisper("Greetings, hero. I can reforge your epic into its Primal form. This gift is freely given, should you choose it though some may keep the original and walk the harder path. The choice is yours.");
    }
}

sub EVENT_ITEM {
    foreach my $epic_id (keys %epics) {
        # Check for exactly 1 of the epic
        if (plugin::check_handin(\%itemcount, $epic_id => 1)) {
            my $primal_id = $epic_id + 1000000;
            quest::summonitem($primal_id);
            plugin::Whisper("Your $epics{$epic_id} has been reborn as a Primal weapon!");
            return;
        }
    }

    # If no matches, return items
    plugin::return_items(\%itemcount);
}
