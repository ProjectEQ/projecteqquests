sub EVENT_SPAWN
{
	quest::settimer("try_sit", 1);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(3);
                quest::stoptimer("try_sit");
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::stoptimer("try_sit");
}