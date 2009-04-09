#Tserrina_Syl`Tor Spawn
#npc - #Tserrina_Syl`Tor (111154)
#zone - Frozenshadow
#Angelox

sub EVENT_DEATH{
 quest::delglobal("Tserr");
 quest::setglobal("Tserr",2,3,"F");
 $Tserr=undef;
  };