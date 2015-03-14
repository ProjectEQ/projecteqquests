sub EVENT_SPAWN
{
	quest::settimer("expire", 45);
}

sub EVENT_TIMER
{
	quest::emote("explodes in a shower of regenerating spores.");
	my @client_list = $entity_list->GetClientList();
	foreach $ent (@client_list)
	{
		my $m_dist = plugin::DistNoRoot($npc, $ent);
		if($m_dist <= 40000)
		{
			my $rand_amount_heal = int(rand(4000));
			my $rand_amount_mana = int(rand(3000));
			$ent->HealDamage($rand_amount_heal, $npc);
			$ent->SetMana($ent->GetMana() + $rand_amount_mana);
		}
	}
	quest::depop();
}