############################################
# ZONE: East Freeport (freporte)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: July 28,2005
# VERSION: 1.0
# BASE QUEST BY: MWMDRAGON
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Branis_Noolright
# ID: 10158
# TYPE: Warrior
# RACE: Human
# LEVEL: 20
#
#
# *** NPC NOTES ***
#
# Signal Sent and responded to.
#
############################################

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello traveler,Come to hear my tales.");
  }
}


sub EVENT_SIGNAL {
  # Signal sent from Henna Treghost saying "Sing us a melody."
  quest::say("Here's one for Sir Lucan... He's just a ruler. In a long line of rulers. Looking for a few more orcs to slay. They say that he fights them with one hand tied to his back. And he won't leave Freeport till you remember his name. Thank you.");

  # animationname ID- 58 (Dance)
  quest::doanim(58);
}

#END of FILE Zone:shortzonename  ID:10158 -- Branis_Noolright