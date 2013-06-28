sub EVENT_SPAWN
{
	$npc->SetAppearance(3);
	quest::settimer("try_death", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_death")
	{
		$npc->SetAppearance(3);
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::stoptimer("try_death");
}