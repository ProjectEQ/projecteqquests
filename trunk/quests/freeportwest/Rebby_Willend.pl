############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Rebby_Willend
# ID: 9115
# TYPE: Rogue
# RACE: Halfling
# LEVEL: 27
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Message to Rebby ID-18923
# Rebby's Rat Whiskers ID-13158
#
# *** QUESTS INVOLVED IN ***
#
#1 - Message For Rebby
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
quest::say("Hey friend. nice wallet ya got there.  Bet it's fulla money. huh?  Why don't ya let me take a quick look. huh?");
}

}

sub EVENT_ITEM
{
         # Message to Rebby ID-18923
 	 if($itemcount{18923} == 1)
 	   {
	   quest::ding();
    	   quest::exp(50);
           # Rebby's Rat Whiskers ID-13158
	   quest::summonitem("13158");
     	   }
}

#END of FILE Zone:freportw  ID:9115 -- Rebby_Willend