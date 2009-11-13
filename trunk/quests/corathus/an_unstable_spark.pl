sub EVENT_SPAWN
{
	quest::settimer("explode_timer", 10);
	quest::emote("begins to overload.");
}

sub EVENT_TIMER
{
	if($timer eq "explode_timer")
	{
		quest::stoptimer("explode_timer");
		quest::emote("overloads, damaging everything around it.");
		
		my @clientlist = $entity_list->GetClientList();
		foreach $ent (@clientlist)
		{
			my $m_dist = plugin::DistNoRoot($npc, $ent);
			if($m_dist <= 10000)
			{
				$ent->Damage($npc, 3000, 2993, 4, false);
			}
		}
		$npc->Kill();
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("explode_timer");
}