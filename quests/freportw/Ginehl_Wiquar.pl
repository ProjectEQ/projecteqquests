############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 30,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Ginehl_Wiquar
# ID: 9127
# TYPE: Wizard
# RACE: Human
# LEVEL: 65
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Adventure in the Rujarkian Hills (LDON)
#
# *** QUESTS AVAILABLE TO ***
#
#1 -All
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("Ah, you’re here to receive information. I’ve have a steady stream of messengers bringing me more history around the goblins and orcs in the Rujarkian Hills. It’s a very interesting story. The gods themselves were involved, don’t you know. You see, Solusek Ro, the lord of Flame, created the Serpent Mountains by arching the crust of Norrath and brought burning heat down upon the inhabitants of Norrath. A tribe of goblins and orcs were trapped somewhere beneath the surface. The ages of evolving, warring, and fighting produced the result we see in the hills. The goblins lost their control of the hills some time ago, but I don’t know when. There is much more behind that story, though. I can tell you more later. There are too many ears about.
");
 quest::me("You have received an invaluable piece of information!");

 }

}

#END of FILE Zone:freportw  ID:9127 -- Ginehl_Wiquar