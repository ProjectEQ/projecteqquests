############################################
# ZONE: East Freport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 27,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Netuk_Phenzon
# ID: 10101
# TYPE: Shadowknight Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Sealed Letter ID- 12270 (Not the Correct note but it will do)
#
# Random Reward Items
#
# Bronze Bastard Sword ID-5029
# Bronze Battle Axe ID-5028
# Bronze Halberd ID-5031
#
# *** QUESTS INVOLVED IN ***
#
#1 - questname
#2 - questname
#3 - questname
#
# *** QUESTS AVAILABLE TO ***
#
#1 - classes_that_can_do_the_quest
#2 - classes_that_can_do_the_quest
#3 - classes_that_can_do_the_quest
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
   quest::say("Welcome $name. Let us fill your heart with hate. May you carry that hate unto your fellow citizens. Innoruuk has need of your services. We have A [ mission ] for you. ");
   }

   if($text=~/mission/i)
   {
   quest::say("There is a man called Groflah Steadirt. He runs A weapons shop here in Freeport. Our sources tell us he was given A piece of parchment taken from one of our allies. Who that is is none of your business. We only require you to recover the parchment, which he No doubt has on him. End his life and return the note to me. Do not let me see your miserable face again until you have the parchment. ");
   }

}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # A Sealed Letter ID- 12270 (Not the Correct note but it will do)
   if(plugin::check_handin(\%itemcount, 12270 => 1))
   {
   quest::ding();
   quest::say("This isn't much, but let it show you the gratitude the Dismal Rage has for your deeds.");
   quest::exp("100");

   
   ### Random Item choosing if needed
   $random=int(rand 5029+5028+5031);
   # Bronze Bastard Sword ID-5029 - Bronze Battle Axe ID-5028 - Bronze Halberd ID-5031
   quest::summonitem($random);

   # Dismal Rage Faction ID - 86
   quest::faction("86","1");
   # Opal Dark Briar Faction ID - 235
   quest::faction("235","1");
   # Knights of Truth Faction ID - 184
   quest::faction("184","-1");
   }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10101 -- Netuk_Phenzon



