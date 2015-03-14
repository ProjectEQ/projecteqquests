sub EVENT_SPAWN
{
	quest::settimer("suppress_start", 8);
}

sub EVENT_TIMER
{
	if($timer eq "suppress")
	{
		my $octo = $entity_list->GetMobByNpcTypeID(365035);
		if($octo)
		{
			$octo->HealDamage(2500, $npc);
		}
	}
	else
	{
		quest::emote("begins to suppress the fires on Octo Assault Bot.");
		quest::stoptimer("suppress_start");
		quest::settimer("suppress", 1);
	}
}