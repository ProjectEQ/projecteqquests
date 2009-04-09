#npc - Spawns #Cara_Omica (111163)
#zone - FrozenShadow
#Angelox

sub EVENT_DEATH{
quest::spawn2(111163,0,0,200.0,978.0,186.60,250);
quest::delglobal("omica");
quest::setglobal("omica",3,3,"F");
 $omica=undef;
 };