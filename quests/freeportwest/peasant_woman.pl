############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: peasant_woman
# ID: 9122
# TYPE: Warrior
# RACE: Qeynos Citizen
# LEVEL: 20
#
# *** ITEMS GIVEN OR TAKEN ***
#
# bucket of water ID-29008
#
# *** QUESTS INVOLVED IN ***
#
#1 - The Fiery Defender (Paladin Epic)
#
# *** QUESTS AVAILABLE TO ***
#
#1 -Paladin
#
# *** NPC NOTES ***
#
#
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::emote("grunts as she tries to fill two buckets of [water]. Her frail arms strain at her work and pain fills her eyes with tears.");
 }

 if($text=~/Water/i && $class == "Paladin")
 {
 quest::say("Aye, water, m'lord. For my brother. He is very sick. He's needin' drink. He's burnin' up. I am sick myself but still able to move, a little. I must [take this water to him] before he gets worse.");
 }

 if($text=~/I will take it/i && $class == "Paladin")
 {
 quest::say("Surely you are a pure soul. If you would take this bucket of water to my brother, I would be forever grateful. I am just so tired, I need to rest... She slumps to the floor and begins to breathe shallowly, in short, harsh gasps.");
 # bucket of water ID-29008
 quest::summonitem("29008");
 }

}

#END of FILE Zone:freportw  ID:9122 -- peasant_woman