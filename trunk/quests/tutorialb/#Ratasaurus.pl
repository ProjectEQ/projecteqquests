# NPC: Tutorial rats
# Angelox

sub EVENT_COMBAT{
    quest::emote("races forward to attack.");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("'s corpse stops moving");
 }

# EOF zone: Tutorialb