############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Lorme_Tredore
# ID: 9078
# TYPE: Guild Master Magician
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Tattered Note ID-18740
# Used Violet Robe ID-13559
# Fleshy Orb ID-13951
# Fine Steel Scimitar ID-5353
#
# *** QUESTS INVOLVED IN ***
#
#1 - Newbie Note Magician
#2 - Fleshy Orb
#
# *** QUEST AVAILABLE TO ***
#
#1 - Magician
#2 - All
#
############################################

sub EVENT_SAY {
  if ($text=~/hail/i && ($class eq "Magician")) {
    quest::say("Hello $name. If you are new here you might have a note for me.");
    quest::emote("mumbles under his breath - Now where did I lose that Fleshy Orb.");
  }
  else {
    quest::say("Hello $name. Welcome to the Academy.");
  }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 13951 => 1)) { #Fleshy Orb
      quest::say("Ah. Thank you for bringing this to me! I will make very good use of it. Here take this small token of my appreciation in return. Guard Jenkins will no longer require it as he was killed on the training field yesterday. Tsk. tsk. tsk.");
      quest::ding();
      quest::exp(100);
      quest::summonitem(5353); #Fine Steel Scimitar
    }
    if(plugin::check_handin(\%itemcount, 18740 => 1)) { #A Tattered Note
      quest::say("Thanks. Please take this robe to help you on your journeys.");
      quest::ding();
      quest::exp(100);
      quest::summonitem(13559); #Used Violet Robe
    }
    plugin::return_items(\%itemcount);
}
# END of FILE Zone:freportw  ID:9078 -- Lorme_Tredore