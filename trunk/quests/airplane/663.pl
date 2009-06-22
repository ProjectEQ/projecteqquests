############################################
# ZONE: Plane of Sky (airplane)
# LAST EDIT DATE: May 17, 2009
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: sk_pet_66_
# ID: 663
# TYPE: Pet
# RACE: 85 (Spectre)
# LEVEL: 63
#
# *** QUESTS INVOLVED IN ***
#
# Plane of Sky Quirkiness
# Necromancer/Shadowknight Pets become a Pink Will-o-Wisp
# 
# *** QUESTS AVAILABLE TO ***
#
# All Necromancer/Shadowknight Pets
#
############################################

sub EVENT_SPAWN
{
    quest::npcrace(69);
    quest::npctexture(1);
    quest::npcsize(4);
}
#END of FILE Zone:airplane  ID:663 -- sk_pet_66_

