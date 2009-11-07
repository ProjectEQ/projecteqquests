sub EVENT_SPAWN
{
	quest::settimer("expire", 45);
}

sub EVENT_TIMER
{
	quest::emote("explodes in a shower of paralyzing spores.");
	my @client_list = $entity_list->GetClientList();
	foreach $ent (@client_list)
	{
		my $m_dist = plugin::DistNoRoot($npc, $ent);
		if($m_dist <= 40000)
		{
			$ent->Stun(8000);
		}
	}
	quest::depop();
}