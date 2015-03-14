# Spawns Spirit of Radir(176085) when Radir Fireshower dies.
sub EVENT_DEATH_COMPLETE
{
quest::spawn("176085","0","0","-2037","-765","-17");
}