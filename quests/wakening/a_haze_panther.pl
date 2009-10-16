sub EVENT_SPAWN 
{
	quest::settimer(1,1);
}

sub EVENT_TIMER 
{
	quest::npcrace(240);
	quest::stoptimer(1);
}

sub EVENT_ATTACK
{
	quest::npcrace(76);
}