sub EVENT_SPAWN
{
	quest::settimer("try_sit", 3);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
	}
	quest::stoptimer("try_sit");
	quest::settimer("try_sit", 10);
}