my $m_target;
sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		if($m_target)
		{
			my $c_name = $m_target->GetCleanName();
			quest::say("combat exit $c_name.");
		}
	}
	elsif($combat_state == 1)
	{
		$m_target = $npc->GetHateRandom();
		if($m_target)
		{
			my $c_name = $m_target->GetCleanName();
			quest::say("combat entered $c_name.");
		}
	}
}