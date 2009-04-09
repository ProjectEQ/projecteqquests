# Angelox

sub EVENT_ATTACK{
 quest::emote("hisses at you, its sharp teeth gnashing for your flesh!");
}

sub EVENT_DEATH{
 quest::delglobal("rage");
 quest::setglobal("rage",2,3,"F");
 $rage=undef;
}

# EOF zone: veksar NPCs: spawn a_raging_bloodgill_goblin (109093)