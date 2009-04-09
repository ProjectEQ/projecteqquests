# respawn random mob on a sanctum sentinel death - list favors another sanctuary sentinel
# 90% of the time
# Enestox, Angelox

sub EVENT_DEATH{
 #quest::say("I'm dead");
 quest::delglobal("krak");
 quest::setglobal("krak",2,3,"F");
 $krak=undef;
  };

# EOF zone: nadox NPCs: a_sanctuary_sentinel Captain_Krakskull