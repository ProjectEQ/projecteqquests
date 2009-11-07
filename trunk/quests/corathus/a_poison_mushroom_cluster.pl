sub EVENT_SPAWN
{
	quest::settimer("expire", 45);
}

sub EVENT_TIMER
{
	quest::emote("explodes in a shower of poisonous spores.");
	my @client_list = $entity_list->GetClientList();
	foreach $ent (@client_list)
	{
		my $m_dist = plugin::DistNoRoot($npc, $ent);
		if($m_dist <= 40000)
		{
			my $rand_amount_damage = int(rand(2000));
			my $rand_amount_mana_drain = int(rand(1000));
			$ent->Damage($npc, $rand_amount_damage, 937, 24, 0);
			$ent->SetMana($ent->GetMana() - $rand_amount_mana_drain);
		}
	}
	quest::depop();
}