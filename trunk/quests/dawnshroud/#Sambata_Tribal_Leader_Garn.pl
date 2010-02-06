##########################################
# ZONE: Dawnshroud Peaks (dawnshroud)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: February 6, 2010
# VERSION: 1.0
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

EVENT_DEATH {
    if(!defined($qglobal{"Rockhopper_Sambata"})) {
        quest::spawn_condition($zonesn, 2, 1);
        quest::spawn_condition($zonesn, 1, 0);
    }
}

# END of FILE Zone:dawnshroud  ID:174277 -- #Sambata_Tribal_Leader_Garn


