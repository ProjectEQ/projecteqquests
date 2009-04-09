#Tserrina_Syl`Tor Spawn
#npc - #Tserrina_Syl`Tor (111154)
#zone - Frozenshadow
#Angelox

sub EVENT_SPAWN
{
	quest::delglobal("Tserr");
	quest::setglobal("Tserr",2,3,"F");
	$Tserr=undef;
	quest::delglobal("omica");
	quest::setglobal("omica",2,3,"F");
	$omica=undef;
}