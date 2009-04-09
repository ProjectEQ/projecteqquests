############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 6,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Janam_Rekish
# ID: 9116
# TYPE: Rogue
# RACE: Half Elf
# LEVEL: 14
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Note ID-18201 (Note the real note but will do until the real on is collected or made)
# A Note ID-18200 (Note the real note but will do until the real on is collected or made)
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note for Janam
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
 quest::say("Ah. hello there. friend!  Me an' Rebby here. we're a just couple o' regular merchants.  Though we've got nothin' to sell right now. we'd gladly take any donations.  Them's the breaks. I suppose.");
    }
}

sub EVENT_ITEM
{
 # A Note ID-18201
 if ($itemcount{18201} == 1)
 {
 quest::emote(" scribbles out a note and says ");
 # A Note ID-18200
 quest::summonitem("18200");
 quest::say("Please make sure that Harkin Duskfoot gets this right away...
if you lose it . it could mean both of our heads. ");
 }
 else
 {
 quest::say("Thanks for the donations $name.");
 }


}

#END of FILE Zone:freportw  ID:9116 -- Janam_Rekish