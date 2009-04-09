# #A_Broken_Skull_Peer
# Enestox, Angelox

sub EVENT_DEATH{
 quest::delglobal("peer");
 quest::setglobal("peer",2,3,"F");
 $peer=undef;
  };

# EOF zone: nadox NPCs: #A_Broken_Skull_Peer