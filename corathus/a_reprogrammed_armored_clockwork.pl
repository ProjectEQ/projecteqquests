sub EVENT_COMBAT
{
	if($combat_state == 1)
	{
		quest::settimer("spark_spawn", 20);
	}
	else
	{
		quest::stoptimer("spawn_spawn");
	}
}

sub EVENT_TIMER
{
	if($timer eq "spark_spawn")
	{
		quest::emote("begins to give off sparks.");
		quest::spawn2(365028, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
	}
}