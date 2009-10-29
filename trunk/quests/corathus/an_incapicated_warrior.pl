sub EVENT_SPAWN
{
	quest::settimer("try_sleep", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_sleep")
	{
		$npc->SetAppearance(3);
	}
	quest::stoptimer("try_sleep");
	quest::settimer("try_sleep", 10);
}