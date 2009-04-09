############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 3,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: #Translocator_Setikan
# ID: 10155
# TYPE: Wizard
# RACE: Gnome
# LEVEL: 1
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
# This file must be named the NPCID or it won't work.
#
# Translocated the PC to the (Ocean of Tears)
#
############################################


sub EVENT_SAY
{

 if($text=~/Hail/i)
 {
 quest::say("Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to travel to the [Ocean of Tears] in the meantime, I can transport you to my companion there.");
 }
 if($text=~/Ocean of Tears/i){
 quest::say("On your way");
 # Used until the actual translocate spells can be cast on the PC by NPCs.
 quest::movepc(69, -9000, 459, 14);
 }
 
}

#END of FILE Zone:freporte  ID:10155 -- #Translocator_Setikan


