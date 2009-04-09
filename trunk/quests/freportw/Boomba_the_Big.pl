############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Boomba_the_Big
# ID: 9126
# TYPE: Merchant
# RACE: Ogre
# LEVEL: 20
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
############################################

sub EVENT_SAY
{ 
if($text=~/Hail/i)
 {
 quest::say("Hullo!!  Me is Boomba.  Me make da bestest pickles in da Norrath. Me gots da dwarfies. da halflings. da humies - me even gots da pixie pickles!!  Of course all of dem were baddies from da dunjuns.  Da guards say it gud ta pickle da baddies.");
 }
}

#END of FILE Zone:freportw  ID:9126 -- Boomba_the_Big

