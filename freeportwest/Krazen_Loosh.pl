############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Krazen_Loosh
# ID: 9143
# TYPE: Warrior
# RACE: Freeport Guards
# LEVEL: 10
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
# Spawns in and Attacks Guard_Alayle NPCID-9135
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("The towering wall of stone is clearly unmovable at this point, being held in place by collection of magical energies.");
 }

}

sub EVENT_SPAWN
{
quest::say("Hello, Alayle. We just got a message from Qeynos. I think you should come with me.");
# Sent to Guard_Alayle NPCID-9135
quest::signal(9135,2);
quest::say("As you try to open penetrate the stone wall it is clearly being held in place by a powerful force.");
quest::attack("Guard_Alayle");
}


#END of FILE Zone:freportw  ID:9143 -- Krazen_Loosh
