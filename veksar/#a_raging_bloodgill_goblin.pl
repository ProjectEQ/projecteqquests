# Angelox

sub EVENT_AGGRO {
  quest::emote("hisses at you, its sharp teeth gnashing for your flesh!");
}

sub EVENT_DEATH_COMPLETE {
  quest::setglobal("rage",2,3,"F");
}

# EOF zone: veksar NPCs: spawn a_raging_bloodgill_goblin (109093)