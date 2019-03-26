# On death, spawns the Idol of Rallos Zek

sub EVENT_DEATH_COMPLETE {
  quest::shout("Protect the Idol of Zek!");
  quest::spawn2(113341,0,0,1289,1300,-90,509); # NPC: #The_Idol_of_Rallos_Zek
}

# Quest by mystic414

