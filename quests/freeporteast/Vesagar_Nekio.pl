############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Vesagar_Nekio
# ID: 10097
# TYPE: Cleric Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#
#
# *** QUESTS AVAILABLE TO ***
#
#
#
# *** NPC NOTES ***
#
# Heals , Removes poison , Removes disease for evil players.
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Welcome into our church of rage.  I am Vesagar Nekio. servant of Innoruuk.  If you should need me to [cure poison]. [cure disease]. or if you [require healing]. just let me know.");
}

if($text=~/cure poison/i && $faction <="4")
{
quest::say("Ally of the Dismal Rage,  Be free of poison!!");
  # Cure Poison Spell
  quest::selfcast(203);
}

elsif($text=~/cure disease/i && $faction <="4")
{
quest::say("Ally of the Dismal Rage,  Be free of disease!!");
  # Cure Disease Spell
  quest::selfcast(213);
}

elsif($text=~/require healing/i && $faction <="4")
{
quest::say("Ally of the Dismal Rage,  Be healed of all your wounds!!");
  # Complete Healing Spell
  quest::selfcast(13);
}
else
{
quest::say("Blasphemer!!  You are no ally of the Dismal Rage.  Run while you still have legs!!");
}

}

#END of FILE Zone:freporte  ID:10097 -- Vesagar_Nekio
 

