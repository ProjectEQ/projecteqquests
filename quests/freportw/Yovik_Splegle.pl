############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 25,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Yovik_Splegle
# ID: 9117
# TYPE: Wizard
# RACE: Human
# LEVEL: 11
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Staff of Dismal Rage
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Enchanter, Magician, Necromancer, Wizard
#
# *** NPC NOTES ***
#
# This NPC must drop Yovik Splegle's Head ID-19935 (For the Staff of Dismal Rage Quest)
#
############################################


sub EVENT_SAY
{ 
if($text=~/Hail/i)
{
quest::say("Greetings $name. Beware the corruption that has infected Freeport. Even the tower of the Arcane Scientists is not safe from the slimy hands of the Dismal Rage. I fear Opal Darkbriar is not what she seems and is darkening the minds of her apprentices.");
}

}

#END of FILE Zone:freportw  ID:9117 -- Yovik_Splegle