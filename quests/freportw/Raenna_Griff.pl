############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 24,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Raenna_Griff
# ID: 9118
# TYPE: Paladin
# RACE: Human
# LEVEL: 11
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Dismal Knight Important Task
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Shadowknight
#
# *** NPC NOTES ***
#
# NPC Must Drop: Raenna Griff's Head ID-19934 (For Dismal Knight Important Task Quest)
#
############################################


sub EVENT_SAY
{ 
  if($text=~/Hail/i)
  {
  quest::say("Hail $name. If it is refuge you seek from the evil that is corrupting this city then I suggest you flee to Qeynos or take up arms along side the Sentries of Passion and the Knights of Truth. You must have faith that the Marr twins will not let this city fall to the hate of the Dismal Rage.");
  }

}

#END of FILE Zone:freportw  ID:9118 -- Raenna_Griff