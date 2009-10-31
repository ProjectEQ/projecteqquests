sub EVENT_SPAWN
{
	quest::emote("begins to suppress the fires on Octo Assault Bot.");
	quest::settimer("suppress", 1);
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
}