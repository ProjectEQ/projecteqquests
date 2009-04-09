# Tholris
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("stares in contemplation at the landscape.");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::emote("breathes quickly and sweats as he channels his spirit into the sky.");
  }
}


# EOF zone: eastkarana ID: 15043 NPC: Tholris

