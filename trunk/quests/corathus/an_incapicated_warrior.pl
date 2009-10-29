sub EVENT_SPAWN
{
	my $random_time = int(rand(3)) + 3;
	quest::settimer("try_sleep", $random_time);
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