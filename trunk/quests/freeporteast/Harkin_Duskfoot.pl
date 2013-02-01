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
# NAME: Harkin_Duskfoot
# ID: 10107
# TYPE: Rogue Guild Master
# RACE: Dwarf
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Note to Janam ID-18015
# Note to Harkin ID-18016
# Used Merchants Gloves ID-1054
#
# *** QUESTS INVOLVED IN ***
#
#1 - Note to Janam
#2 - Note for Harkin
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#1 - All
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
quest::say("HA! Greetings there. $name!  How are ya this fine day?  Me?  I'm doing all right.  Guard duty down here always reminds me of home.");
# Signal to Beur_Tenlah NPCID-10106
 quest::signal(10106,1);
}

if($text=~/message/i)
{
quest::say("'Ok, $name , I need you to take this message to Janam in West Freeport. He is usually hanging out in front of the Theater of the Tranquil with that good-for-nothing Rebby. Anyway, give this note to Janam and bring his reply back to me.");
# Note to Janam ID-18015
quest::summonitem(18015);
}

}

sub EVENT_SIGNAL
{
# Signal from Beur_Tenlah NPCID-10106
quest::say("Bah! Don't listen to this fool. Listen, I've something a little more important for you to do than buy ales. I need you to take a [message] to my friend Janam over in West Freeport.");

}

sub EVENT_ITEM
{
 #do all other handins first, then let it do disciplines
 # Note to Harkin ID-18016
 if(plugin::check_handin(\%itemcount, 18016 => 1))
 {

 quest::say("Ah, good work, $name . And quick too, I'll makes sure that Elisi hears of your loyal work. Here... take this for your efforts.. it's not much, but it's all I have on me right now.");
 quest::ding();
 quest::exp(50);
 # Used Merchants Gloves ID-1054
 quest::summonitem(1054);
 quest::givecash("6","0","0","0");
 
 # Coalition of Tradefolk Underground Faction
 quest::faction("48","1");
 # Coalition of Trade Folk Faction
 quest::faction("47","1");
 # Carson McCabe Faction
 quest::faction("31","1");
 # Corrupt Qeynos Guards Faction
 quest::faction("53","1");
 # Freeport Militia Faction
 quest::faction("105","1");
 }

  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freporte  ID:10107 -- Harkin_Duskfoot

 
