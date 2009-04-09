############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: May 10,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Soulbinder_Grunson
# ID: 10191
# TYPE: Warrior
# RACE: Human
# LEVEL: 65
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
# *** NPC NOTES ***
#
#
#
############################################


sub EVENT_SAY
{

if($text=~/Hail/i){quest::say("Greetings $name. When a hero of our world is slain  their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity it is my duty to [bind your soul] to this location if that is your wish.");}

if($text=~/bind my soul/i || $text=~/bind your soul/i)
  {
  quest::say("Binding your soul.  You will return here when you die.");
  # Bind Affinity Spell
  quest::selfcast(2049);
  }
}

#END of FILE Zone:freporte  ID:10191 -- Soulbinder_Grunson


