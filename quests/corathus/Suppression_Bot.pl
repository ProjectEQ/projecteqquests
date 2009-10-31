sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("suppress");
	}
	else
	{
		my $octo = $entity_list->GetMobByNpcTypeID(365035);
		if($octo)
		{
			my $boss_name = $octo->GetCleanName();
			quest::emote("begins to suppress the fires on $boss_name.");
		}
		quest::settimer("suppress", 1);
	}
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