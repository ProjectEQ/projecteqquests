############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 25,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Ulia_Yovar
# ID: 9119
# TYPE: Cleric
# RACE: Human
# LEVEL: 11
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Dismal Priest Further Instruction
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Cleric
#
# *** NPC NOTES ***
#
# This NPC must drop Ulia Yovar's Head ID-19933 (For the Dismal Priest Further Instruction Quest)
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Greetings $name. If you have love and kindness in your heart then seek refuge at the Temple of Marr and the Hall of Honor in North Freeport. There is a growing evil spreading through the city. May Erollisi save us and cleanse this city of the hatred and corruption spread by the vile Dismal Rage.");
}

}
#END of FILE Zone:freportw  ID:9119 -- Ulia_Yovar