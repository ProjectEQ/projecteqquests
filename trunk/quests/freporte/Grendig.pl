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
# NAME: Grendig
# ID: 10127
# TYPE: Warrior
# RACE: Dwarf
# LEVEL: 12
#
# *** ITEMS GIVEN OR TAKEN ***
#
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Coalition Trader Next Task
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Rogue
#
# *** NPC NOTES ***
#
#Must drop Crate of Pick Heads ID- MISSING
#
############################################


sub EVENT_SAY
{ 

if($text=~/Hail/i)
{
quest::say("Hello there! If ya don't mind I'd like to get some rest in my room here. I just arrived from Kaladim and need some rest to recover from the journey. Dwarves were'nt meant to sail the ocean ya know. It's a good thing we've got strong stomachs though or I'd be a few pounds lighter!");
}

}

#END of FILE Zone:freporte  ID:10127 -- Grendig


