##########################################
# ZONE: Dawnshroud Peaks (dawnshroud)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: January 22, 2012
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: #Sambata_Tribal_Leader_Garn
# ID: 174277
# TYPE: Warrior
# RACE: Galorian
# LEVEL: 47
#
# *** ITEMS GIVEN OR TAKEN ***
# 
# *** QUESTS INVOLVED IN ***
#
# Rockhopper/Sambata Cycle
# Cycles to the Sambata when killed if #Rock_Garn_Timer is not up
#
# *** QUESTS AVAILABE TO ***
#
# Everyone
#
############################################# 

sub EVENT_AGGRO {
    quest::emote("grunts at you and rushes in to attack!");
}

sub EVENT_DEATH {
    if(!defined $qglobals{"Rockhopper_Sambata"}) {
        quest::spawn_condition($zonesn, 2, 1);
        quest::spawn_condition($zonesn, 1, 0);
    }
}

# END of FILE Zone:dawnshroud  ID:174277 -- #Sambata_Tribal_Leader_Garn


