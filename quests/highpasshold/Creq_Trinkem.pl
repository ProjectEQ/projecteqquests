sub EVENT_SPAWN
{
	quest::settimer("try_sit", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_sit");
}