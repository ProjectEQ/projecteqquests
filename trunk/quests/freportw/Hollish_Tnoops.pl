############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Hollish_Tnoops
# ID: 9144
# TYPE: Warrior
# RACE: Dark Elf
# LEVEL: 14
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Dark Elf Courier
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#
# *** NPC NOTES ***
#
# Must drop Dark Elf Head ID-14114  (For Dark Elf Courier Quest)
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("Hail. I am in a bit of a hurry. Please excuse me.");
 }

}

#END of FILE Zone:freportw  ID:9144 -- Hollish_Tnoops