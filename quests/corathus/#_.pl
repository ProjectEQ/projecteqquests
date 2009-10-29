sub EVENT_SPAWN
{
	quest::settimer("try_sleep", 10);
}

sub EVENT_TIMER
{
	if($timer eq "try_sleep")
	{
		$npc->SetAppearance(3);
		quest::stoptimer("try_sleep");
	}
}