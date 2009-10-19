sub EVENT_SPAWN
{
	quest::settimer("try_die", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_die")
	{
		$npc->SetAppearance(3);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_die");
}