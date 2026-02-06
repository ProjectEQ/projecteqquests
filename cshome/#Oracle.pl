# Epic Reforger NPC
# Base epics -> Ancient (+2,000,000)
# Primal epics (+1,000,000) -> Ancient (+1,000,000 more)

my %epics = (
        5532   => "Water Sprinkler of Nem Ankh", # Cleric
        1683   => "Celestial Fists",             # Monk
        20488  => "Earthcaller",                 # Ranger
        20487  => "Swiftwind",                   # Ranger alt
        10099  => "Fiery Defender",              # Paladin
        6640   => "Baton of Faith",              # Paladin alt
        5504   => "SoulFire",                    # Paladin pre-epic
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
        10652  => "Celetial fists",              # Monk Epic (typo kept as-is)
        8495   => "Claw of the Savage Spirit",   # Beastlord Epic
        8496   => "Claw of the Savage Spirit",   # Beastlord Epic (alt/dual)
        14341  => "Staff of the Four",           # Wizard Epic
        # Add missing epics here if you want ALL classes supported
);

use constant PRIMAL_OFFSET  => 1000000;
use constant ANCIENT_OFFSET => 2000000;

sub EVENT_SAY {
    if ($text=~/hail/i) {
        plugin::Whisper(
            "Greetings, hero. Hand me your epic (base or Primal) and I will reforge it into its Ancient form. "
            . "Base epics become Ancient directly; Primal epics are upgraded to Ancient."
        );
    }
}

sub EVENT_ITEM {

    foreach my $base_id (keys %epics) {

        my $primal_id  = $base_id + PRIMAL_OFFSET;
        my $ancient_id = $base_id + ANCIENT_OFFSET;

        # If they hand in a BASE epic -> give ANCIENT
        if (plugin::check_handin(\%itemcount, $base_id => 1)) {
            quest::summonitem($ancient_id);
            plugin::Whisper("Your $epics{$base_id} has been reborn as an Ancient weapon!");
            return;
        }

        # If they hand in a PRIMAL epic -> give ANCIENT
        if (plugin::check_handin(\%itemcount, $primal_id => 1)) {
            quest::summonitem($ancient_id);
            plugin::Whisper("Your Primal $epics{$base_id} has been reforged into an Ancient weapon!");
            return;
        }
    }

    # If no matches, return items
    plugin::return_items(\%itemcount);
}
