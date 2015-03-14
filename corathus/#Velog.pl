$min_h;
$max_h;
$cleave_damage;

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("enrage");
		quest::stoptimer("cleave");
		quest::modifynpcstat("min_hit", 1800);
		quest::modifynpcstat("max_hit", 2200);
	}
	else
	{
		quest::settimer("enrage_up", 30);
		quest::settimer("cleave", 12);
		$min_h = 1800;
		$max_h = 2200;
		$cleave_damage = 3000;
		quest::shout("Rarrrrrrggh!! Velog SMASH!");
	}
}

sub EVENT_TIMER
{
	if($timer eq "enrage_up")
	{
		$min_h = $min_h + 500;
		$max_h = $max_h + 500;
		$cleave_damage = $cleave_damage + 800;
		quest::modifynpcstat("min_hit", $min_h);
		quest::modifynpcstat("max_hit", $max_h);	
		quest::emote("redoubles his efforts.");
	}
	elsif($timer eq "cleave")
	{
		quest::emote("executes a cleaving attack.");
		my @cleave_targets;
		my $tar = $npc->GetTarget();
		if($tar)
		{
			push(@cleave_targets, $tar);
			my @clientlist = $entity_list->GetClientList();
			foreach $ent (@clientlist)
			{
				if($ent->GetID() != $tar->GetID())
				{
					my $m_dist = plugin::DistNoRoot($tar, $ent);
					if($m_dist <= 400.0)
					{
						push(@cleave_targets, $ent);
					}
				}
			}
			
			my $number_targets = @cleave_targets;
			my $damage_per_target = ($cleave_damage / $number_targets);
			foreach $ent (@cleave_targets)
			{
				$npc->DoSpecialAttackDamage($ent, 1, $damage_per_target);
				$npc->AddToHateList($ent, 5000, 0, 0);
			}
		}
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::spawn2(365175, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
	quest::emote("roars in pain and falls over dead.");
	quest::spawn_condition("corathus", 10, 0);
	my $octo = $entity_list->GetMobByNpcTypeID(365035);
	my $spore = $entity_list->GetMobByNpcTypeID(365038);
	
	if(!$spore && !$octo)
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
			$willf->Shout("Fools, defeat my champions and I will simply make more, behold my wondrous behemoth!");
		}
	}
}