sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("short_circuit");
		quest::stoptimer("annih_burn_shared");
		quest::stoptimer("missle_launch");
		quest::stoptimer("repair");	
	}
	else
	{
		my $willf = $entity_list->GetMobByNpcTypeID(365171);
		if($willf)
		{
			$willf->Shout("Ah the XZ-R980 is my latest and greatest creation! I haven't had time to properly test it yet but I suppose you will have to do!");
		}
		quest::settimer("short_circuit", 13);
		quest::settimer("annih_burn_shared", 120);
		quest::settimer("missle_launch", 45);
		quest::settimer("repair", 30);
	}
}

sub EVENT_TIMER
{
	if($timer eq "short_circuit")
	{
		quest::emote("short circuits.");
		my @eligible_targets = $npc->GetHateList();
		my $starter_target = $npc->GetHateRandom();
		my $jumps = 0;
		
		if(!$starter_target)
		{
			return;
		}
		
		#remove our main target from the list and damage them
		my $idx = 0;
		foreach $ent (@eligible_target)
		{
			if($ent->GetID() == $starter_target->GetID())
			{
				delete $eligible_targets[$idx];
				last;
			}
			$idx++;
		}
		$starter_target->Damage($npc, 200, 1075, 24, 0);
		
		#while we still have targets in range on the eligible target list jump and do damage and remove them from the list
		my $last_target = $starter_target;
		do
		{
			$idx = 0;
			my $dist_targ = $last_target;
			$last_target = undef;
			foreach $ent (@eligible_targets)
			{
				$ent->Say("For all!");
				my $m_dist = plugin::Dist($dist_target, $ent);
				if($m_dist < 15.0)
				{
					$ent->Say("I'm in range!");
					$jumps++;
					my $dmg = 200 + (200 * (1.5 * $jumps));
					$ent->Damage($npc, $dmg, 1075, 24, 0);
					$last_target = $ent;
					delete $eligible_targets[$idx];
					last;
				}
				else
				{
					$ent->Say("I'm out of range!");
				}
				$idx++;
			}
		} while($last_target);
	}
}

sub EVENT_DEATH
{
	quest::emote("");
	quest::spawn_condition("corathus", 11, 0);
	my $mino = $entity_list->GetMobByNpcTypeID(365004);
	my $spore = $entity_list->GetMobByNpcTypeID(365038);
	
	if(!$spore && !$mino)
	{
		quest::spawn_condition("corathus", 3, 0);
		quest::spawn_condition("corathus", 4, 0);
		quest::spawn_condition("corathus", 5, 0);
		quest::spawn_condition("corathus", 6, 1);
		quest::spawn_condition("corathus", 7, 1);
		quest::spawn_condition("corathus", 8, 1);
		my $willf = $entity_list->GetMobByNpcTypeID(365171);
		if($willf)
		{
			$willf->Shout("Fools, defeat my champions and I will simply make more, behold my wonderous behemoth!");
		}
	}
}