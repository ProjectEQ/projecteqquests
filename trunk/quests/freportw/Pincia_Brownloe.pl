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


sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to Brownloe Bakery. Please try our muffins. One taste and you will yearn for no other. Nothing compares to a Brownloe Muffin!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("You are in luck! I have a fresh batch that just came out of the oven!");
    quest::signalwith(9057, 1, 10);
  }
  if($signal == 2) {
    quest::say("Farewell, then. I will make sure to have them ready for you tomorrow!");
    quest::signalwith(9057, 2, 10);
  }
}
#END of FILE Zone:freportw  ID:9088 -- Pincia_Brownloe