############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 25,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Pietro_Zarn
# ID: 10102
# TYPE: Shadowknight Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A tattered note ID- 18743
# Faded Crimson Tunic ID- 13561
# Translated Parchment ID- 18961
# Rage War Maul ID-12153
#
# *** QUESTS INVOLVED IN ***
#
#1 - Shadowknight Newbie Note
#2 - The Bayle List
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Shadowknight
#2 - Shadowknight
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
   quest::say("Who are you that you dare to speak with the great Pietro Zarn!! I see nothing more than a whelp in front of me. Innoruuk himself speaks with me. And now you expect me to waste words on you, a common. Begone $name . You have nothing to peak my interest, only my rage.");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # A tattered note ID- 18743
   if(plugin::check_handin(\%itemcount, 18743 => 1))
   {
   quest::ding();
   quest::say("A new member to carry the rage of Innoruuk into the city and beyond. How wonderful. I must admit that you do not appear to carry the rage within. Hopefully you shall color the battlefields with the blood of many knights from the Hall of Truth. Here. Wear this tunic with pride. Ha ha ha!! We shall see young one. We shall see.");
   quest::exp("50");

   # Faded Crimson Tunic ID- 13561
   quest::summonitem("13561");

   # Opal Dark Briar Faction ID - 235
   quest::faction("235","1");
   # Dismal Rage Faction ID - 86
   quest::faction("86","1");
   # Knights of Truth Faction ID - 184
   quest::faction("184","-1");
  }

  # Translated Parchment ID- 18961
  elsif(plugin::check_handin(\%itemcount, 18961 => 1))
  {
   quest::ding();
   quest::say("I will deal with this $name. Take this and know that you are welcomed by the Dismal Rage.");
   quest::exp("100");
   # Rage War Maul ID-12153 
   quest::summonitem("12153");

  }

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}

### EQEmu Quest Template By: MWMDRAGON
### The End of this script must contain 2 empty lines for the EQ Quest System
#END of FILE Zone:freporte  ID:10102 -- Pietro_Zarn



