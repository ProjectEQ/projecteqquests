############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 27,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Nexvok_Thirod
# ID: 10119
# TYPE: Wizard Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID- 18854
# Dark Stained Robe ID-13562
#
# *** QUESTS INVOLVED IN ***
#
#1 - Wizard Newbie Note
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Wizard
#
# *** NPC NOTES ***
#
#
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("I am Nexvok, master wizard of the Dismal Rage.  My associates Heneva and Konious and I provide our services to master Zarn on a regular basis.  People of our talent are in high demand. and Pietro pays well, so we are, of course, very loyal.");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # A tattered note ID- 18854
   if(plugin::check_handin(\%itemcount, 18854 => 1))
   {
   quest::ding();
   quest::say("Thanks");
   quest::exp("100");

   # Dark Stained Robe ID-13562
   quest::summonitem("13562");
   }

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Wizard');
  plugin::return_items(\%itemcount);
}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10119 -- Nexvok_Thirod



