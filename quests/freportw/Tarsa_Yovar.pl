############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 25,2005
# VERSION: 1.0
# ORIGIONAL QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Tarsa_Yovar
# ID: 9120
# TYPE: Warrior
# RACE: Human
# LEVEL: 11
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Dismal Warrior Next Orders
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#
# *** NPC NOTES ***
#
# This NPC must drop Tarsa Yovar's Head ID-19932 (For the Dismal Warrior Next Orders Quest)
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Keep your voice down friend. The Dismal Rage and their fool pawns the Freeport Militia have eyes and ears in every corner of the city. It is not safe for you to be among us unless you too have been placed on the Militias most wanted list.");
}

}

#END of FILE Zone:freportw  ID:9120 -- Tarsa_Yovar

