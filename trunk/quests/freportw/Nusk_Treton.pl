############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 24,2005
# VERSION: 1.0
# ORIGIONAL QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Nusk_Treton
# ID: 9063
# TYPE: Guild Master Wizard
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Strongbox ID-13860
#
# *** QUESTS INVOLVED IN ***
#
#1 Journal Strongbox   ( Supposed to spawn in the Ocean of Tears )
#
# *** QUESTS AVAILABLE TO ***
#
#1 All
#
############################################

sub EVENT_SAY
{ 

  if($text=~/Hail/i)
  {
  quest::say("Freeport!!  Great trade city of Norrath!!  What a wondrous place!  How do you do?  You are an [arcane scientist]. are you not?");
  }

  if($text=~/arcane scientist/i)
  {
  quest::say("Grand!! I remember my younger days within this great academy. I have spent many years of research here in Freeport. I compiled a [locked journal] of my research. Alas, I still am awaiting it's return.");
  }

  if($text=~/locked journal/i)
  {
  quest::say("I lent it to an old colleague of mine in Ak'Anon. He was to send it back aboard a private vessel. A Lenka Stoutheart was to return it to me. It has been one month and counting. I wish there was a young wizard who could [seek out Lenka]. ");
  }

  if($text=~/seek out Lenka/i)
  {
  quest::say("What luck!! I would be most appreciative if you could find Lenka Stoutheart in Freeport and inquire where the Journal Strongbox would be. I do so look forward to it's return.");
  }

}


sub EVENT_ITEM
{

# A Strongbox ID-13860
if($itemcount{13860} == 1)
  {
  quest::say("Grand and fantastic!! You have made my day complete. Here is what little I can offer. Most of my money goes into my research. Thank you. ");
  quest::ding();
  quest::exp("100");
  # Faction Arcane Scientists ID-11
  quest::faction("11","3");
  # Faction Knights of Truth ID-184
  quest::faction("184","3");
  # Faction Opal Dark Briar ID-235
  quest::faction("235","-3");
  # Faction Freeport Militia ID-105
  quest::faction("105","-3");
  quest::givecash("2","10","0","0");
  }

}

#END of FILE Zone:freportw  ID:9063 -- Nusk_Treton