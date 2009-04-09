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
# NAME: Ran_Brownloe
# ID: 9089
# TYPE: Shopkeeper
# RACE: Freeport Guards
# LEVEL: 45
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
# *** QUESTS INVOLVED IN ***
#
#
# *** QUESTS AVAILABLE TO ***
#
#
# *** NPC NOTES ***
#
# Merchant ID- 9029
#
############################################


sub EVENT_SAY
{ 
  if($text=~/Hail/i)
  {
  quest::say("It is good to see new customers here in Brownloe Bakery. but I am very busy right now. If you would like to purchase something. please speak with my wife. Pincia.");
  }

}

#END of FILE Zone:freportw  ID:9089 -- Ran_Brownloe