##########################################
# ZONE: Dawnshroud Peaks (dawnshroud)
# DATABASE: PEQ-PoP
# LAST EDIT DATE: February 6, 2010
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: #Rock_Garn_Timer
# ID: 174240
# TYPE: Warrior
# RACE: Teleport Man
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
# 
# *** QUESTS INVOLVED IN ***
#
# Rockhopper/Sambata Cycle
# Simulate chance that the cycle doesn't change
# even if Garn or Age Old is killed.
#
# *** QUESTS AVAILABE TO ***
#
# Everyone
#
############################################# 

sub EVEN_SPAWN {
    quest::settimer("RGT", 1800);
    if(!defined($qglobal{"Rockhopper_Sambata"})) {
        quest::setglobal("Rockhopper_Sambata", 1, 3, "F");
    }
}

sub EVENT_TIMER {
    if($timer eq "RGT") {
        if(defined($qglobal{"Rockhopper_Sambata"})) {
            quest::delglobal("Rockhopper_Sambata");
        }
        quest::depop();
    }
}

# END of FILE Zone:dawnshroud  ID:174240 -- #Rock_Garn_Timer


