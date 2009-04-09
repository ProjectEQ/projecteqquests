############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Dooly_Jonkers
# ID: 9076
# TYPE: Guild Master Magician
# RACE: Gnome
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Tergen's Spellbook
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
############################################

sub EVENT_SAY
{ 

  if($text=~/Hail/i)
  {
  quest::say("Greetings. $name!  Welcome to the Academy of Arcane Science.  Nowhere on Norrath can you find a greater learning center.");
  }

  if($text=~/Retlon Brenclog/i)
  {
  quest::say("I'm very sorry to report that Retlon was kidnapped by some vile orcs from Crushbone. And I haven't seen him since.");
  }

}

#END of FILE Zone:freportw  ID:9076 -- Dooly_Jonkers

