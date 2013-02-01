############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Guard_Alayle
# ID: 9135
# TYPE: Warrior
# RACE: Freeport guard
# LEVEL: 10
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Sealed Letter ID-18817
# A Tattered Flier ID-18818
#
# *** QUESTS INVOLVED IN ***
#
#1 - Zimel's Blades (Quest for Soulfire)
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Paladin
#
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, citizen! You should not be in the Militia House. These are restricted grounds. Please leave at once unless you have business here.");
  }
  if(($text=~/truth is good/i) && ($class eq "Paladin")) {
    quest::say("Ssshhh!! Pipe down. The others might hear you. You must have something for me. Kalatrina must have given you something if you serve the Hall of Truth. If you have nothing please leave. You will blow my cover.");
  }
}

sub EVENT_ITEM {
  if($class eq "Paladin") {
    if(plugin::check_handin(\%itemcount, 18817 => 1)) { #Sealed Letter
      quest::say("This is not good news. I must leave immediately. Here. Take this to Kala.. I mean my father. I found it on the floor of Sir Lucan DLeres quarters. Thanks again, messenger. I got this just in time.");
  	  quest::ding();
  	  quest::summonitem(18818); #A Tattered Flier
      quest::faction(105,-1); #Freeport Militia
      quest::faction(53,-1); #Corrupt Guards of Qeynos
      quest::faction(311,1); #Steel Warriors
      quest::faction(184,1); #Knights of Truth
      quest::faction(135,1); #Guards of Qeynos
    }
    else {
      quest::say("I do not need this.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::say("You have no business handing me this junk.");
    plugin::return_items(\%itemcount);
  }
}
# After this Krazen_Loosh is supposed to spawn but he does not exsist in the DB.

#END of FILE Zone:freportw  ID:9135 -- Guard_Alayle