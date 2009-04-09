# warning dialogue not to bind near the firepot room in timorous deep
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks at you with eyes that are bleak and dreary as though the essence which keeps it standing is not really there; a surreal look into the future for those who make their stay in the immediate room around you. The ominous figure does not make any sound but nods in your direction as if to tell you that he died here long ago by resting by the nearby fire for too long. In your mind you hear the eerie thoughts of this undead figure, alluding to the fact that it is unwise for you to remain here for too long, lest the mighty water dragon overtake you, as it overtook him.");
  }
}

# EOF zone: timorous ID:  NPC: Curser_Traveler

