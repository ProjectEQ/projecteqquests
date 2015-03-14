# Warlord Skargus, Frontier Mountains
# Second part of the chardok quest, initiated by Herald Telcha
# Regal Band of Bathezid
# global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
#   at 1 : you gave the Signet of Service to the goblin traitor

sub EVENT_SPAWN {
  quest::settimer(1,600);
}

sub EVENT_TIMER {
  quest::depop();
}

