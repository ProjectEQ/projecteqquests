##########################################
# ZONE: Kithicore Forest (kithicor)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: July 6, 2009
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC IFORMATION ***
#
# NAME: Grim_Oakfist
# ID: 20220
# TYPE: Monk
# RACE: Human
# LEVEL: 30
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Unusual Tiger Pelt ID-12341
# Peculiar Tiger Pelt ID-12342
# Strange Tiger Pelt ID-12343
#
# *** QUESTS INVOLVED IN ***
#
# Grim's Tiger Revenge
# Treant Fists
#
# *** QUESTS AVAILABE TO ***
#
# Monks with good Ashen Order Faction
#
############################################# 

sub EVENT_SAY {
    if(($faction < 4)&&($class eq "Monk")) {
        if($text=~/Hail/i) {
            quest::say("It is good to finally meet one who respects the disciplines of the Ashen Order.  All I have met are rangers.  They have interfered with my [mission in the woods].");
        }
        if($text=~/mission in the woods/i) {
            quest::say("I have come here to avenge my family.  One season past, they were attacked by a trio of deadly tigers.  I came here to hunt the beasts down, but then I found the local rangers and residents here protect the tigers.  They seem to be legends in these parts.  The tigers even have name's!!  They call them Eenot, Reggit and Kobb.  I wish I had help from a [fellow monk].");
        }
        if($text=~/fellow monk/i) {
            quest::say("Good!! The rangers are watching me so you must go alone.  I can only wait until the morning, then I must go.  If you find all three tigers, return their pelts to me and I shall reward you with something discovered for monks only.");
            # Spawn Eenot
            quest::unique_spawn(20276, 137, 0, 1499.47, -22.75, 168.35);
            # Spawn Reggit
            quest::unique_spawn(20277, 138, 0, 3063, 1636, 363);
            # Spawn Kobb
            quest::unique_spawn(20278, 139, 0, 3741.9, 256.5, 496.2);
        }
        if($text=~/treant fists/i) {
            quest::say("The treant fists were created by great craftsmen.  They are for the fists of a monk and offer greater dexterity and increase the durability of one's soul.  My last pair were given to Master Puab of the Ashen House training grounds.");
            quest::depop();
        }
    }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 12341 => 1,  12342 => 1,  12343 => 1))
    {
        quest::say("Good work.  I hope you had no run ins with the local rangers.  Here is my reward.  An object from the past which I found in my journeys.  Wish that I could reward you also with [treant fists].");
        # Collar of Neshika ID-12367
        quest::summonitem("12367");
        quest::exp("100");
        quest::ding();
        # Ashen Order Faction ID-12
        quest::faction("12","10");
        # Knights of Truth Faction ID-184
        quest::faction("184","10");
        # Silent Fist Clan Faction ID-300
        quest::faction("300","10");
    }
    else
    {
        quest::say("I asked you to hunt down all three of the tigers.");
        plugin::return_items(\%itemcount);
    }
}
#END of FILE Zone:kithicor ID:20220 -- Grim_Oakfist


