############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 1,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Hemia_Skemner
# ID: 9071
# TYPE: Wizard Guild Master
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Locked Book ID-13863
#
#
# *** QUESTS INVOLVED IN ***
#
#1 - Lydl Mastat
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
# *** NPC NOTES ***
#
#
############################################

sub EVENT_SAY
{
if($text=~/Hail/i)
 {
 quest::say("How are you? Welcome to the Academy of Arcane Science. Please feel free to roam. May knowledge be your goal. Be you a [fellow scientist] or visitor, I am sure you will find whatever you seek.");
 }

 if($text=~/fellow scientist/i)
 {
 quest::say("That is good. I hope you can handle the knowledge of arcane science. Some have gone mad conducting research. Such a person is [Lydl Mastat].");
 }

 if($text=~/Lydl Mastat/i)
 {
 quest::say("Lydl Mastat is nothing more than a young apprentice of mine. He went mad working on a formula for deep water breathing. He now roams the outskirts of Freeport boasting of power he does not have. Someone should [teach Lydl a lesson].");
 }

 if($text=~/teach Lydl a lesson/i)
 {
 quest::say("Then go. He appears near the gates of Freeport from time to time. He is not powerful, but he has a secret. Nothing save magic can harm him. This was the result of an experimental potion he drank. Slay him and return his locked spellbook to me.");
 }

}

sub EVENT_ITEM
{
   # A Locked Book ID-13863
   if($itemcount{13863} == 1)
   {
   quest::say("You have done the world of magic a great justice, $name.");
   quest::ding();
   quest::givecash ("9","9","9","0");

   # Arcane Scientists Faction
   quest::faction("11","1");
   # Knights of Truth Faction
   quest::faction("184","1");
   # Opal Dark Briar Faction
   quest::faction("235","-1");
   # Freeport Militia Faction
   quest::faction("105","-1");
   }
}


#END of FILE Zone:freportw  ID:9071 -- Hemia_Skemner