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
# NAME: Pincia_Brownloe
# ID: 9088
# TYPE: Shopkeeper
# RACE: Qeynos Citizen
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
# Merchant ID-9028 (Baking Supplies)
#
############################################


sub EVENT_SAY
{
 
 if($text=~/Hail/i)
 {
 quest::say("Welcome to Brownloe Bakery. Please try our muffins. One taste and you will yearn for no other. Nothing compares to a Brownloe Muffin!"); }
 }

#END of FILE Zone:freportw  ID:9088 -- Pincia_Brownloe