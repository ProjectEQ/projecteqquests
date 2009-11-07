$missile_target_id = 0;
$missile_x = 0;
$missile_y = 0;
$missile_z = 0;
$is_anni = 0;
$burn_tics = 0;
$burn_target_id = 0;
$has_burned = 0;

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("short_circuit");
		quest::stoptimer("annih_burn_shared");
		quest::stoptimer("missile_launch");
		quest::stoptimer("missile_hit");
		quest::stoptimer("burn_start");	
		quest::stoptimer("burn_tic");	
		quest::stoptimer("anni_start");
		quest::stoptimer("bot_spawn");
		quest::depopall(365026);
	}
	else
	{
		my $willf = $entity_list->GetMobByNpcTypeID(365171);
		if($willf)
		{
			$willf->Shout("Ah the XZ-R980 is my latest and greatest creation! I haven't had time to properly test it yet however I think you all will suffice as test subjects.");
		}
		quest::settimer("short_circuit", 20);
		quest::settimer("annih_burn_shared", 30);
		quest::settimer("missile_launch", 12);
		quest::settimer("bot_spawn", 8);
		$has_burned = 0;
	}
}

sub EVENT_TIMER
{
	if($timer eq "annih_burn_shared")
	{
		if($has_burned == 0)
		{
			my $burn_target = $npc->GetTarget();
			if($burn_target)
			{
				my $target_name = $burn_target->GetCleanName();
				quest::emote("Begins to burn $target_name.");
				$npc->Stun(11500);
				$burn_tics = 0;
				$burn_target_id = $burn_target->GetID();
				quest::settimer("burn_start", 5);
			}
		}
		else
		{
			quest::emote("begins to overload.");
			quest::settimer("anni_start", 6);
			$npc->Stun(6500);
			$is_anni = 1;
		}
	}
	elsif($timer eq "bot_spawn")
	{
		quest::spawn2(365026, 0, 0, $npc->GetX(), $npc->GetY(), $npc->GetZ(), $npc->GetHeading());
	}
	elsif($timer eq "anni_start")
	{
		quest::stoptimer("anni_start");
		quest::emote("overloads, eradicating everything around it.");
		$npc->CastSpell(1948, $npc->GetID(), 10, 0);
	}
	elsif($timer eq "burn_start")
	{
		my $burn_target = $entity_list->GetMobID($burn_target_id);
		quest::stoptimer("burn_start");
		if($burn_target)
		{
			quest::settimer("burn_tic", 1);
			if($burn_target->FindType(40))
			{
				$has_burned = 1;
				$burn_target->BuffFadeByEffect(40);
				quest::emote("has its laser destroyed by the reflected energy.");
				$burn_target_id = $npc->GetID();
				quest::stoptimer("annih_burn_shared");
				quest::settimer("annih_burn_shared", 60);
			}
		}
	}
	elsif($timer eq "burn_tic")
	{
		$burn_tics++;
		
		my $burn_target = $entity_list->GetMobID($burn_target_id);
		if($burn_target)
		{
			if($npc->GetID() == $burn_target->GetID())
			{
				$burn_target->Damage($npc, 30000, 1660, 24, 0);
			}
			else
			{
				$burn_target->Damage($npc, 6000, 1660, 24, 0);
			}
		}
		
		if($burn_tics == 5)
		{
			quest::stoptimer("burn_tic");
		}
	}
	elsif($timer eq "missile_launch")
	{
		my $missile_target = $npc->GetHateRandom();
		if($missile_target)
		{
			my $target_name = $missile_target->GetCleanName();
			quest::emote("locks onto $target_name with a surface to surface missile.");
			quest::settimer("missile_hit", 8);
			$missile_target_id = $missile_target->GetID();
			$missile_x = $missile_target->GetX();
			$missile_y = $missile_target->GetY();
			$missile_z = $missile_target->GetZ();
		}
	}
	elsif($timer eq "missile_hit")
	{
		quest::stoptimer("missile_hit");
		my $missile_target = $entity_list->GetMobID($missile_target_id);
		if($missile_target)
		{
			my $m_dist = plugin::DistNoRootToCoords($missile_target, $missile_x, $missile_y, $missile_z);
			if($m_dist < 400)
			{
				$missile_target_name = $missile_target->GetCleanName();
				quest::emote("has hit $missile_target_name with a surface to surface missile.");
				$missile_target->Damage($npc, 10000, 0xFFFF, 28, 0);
			}
			else
			{
				quest::emote("has missed $missile_target_name with a surface to surface missile.");
				$missile_target_name = $missile_target->GetCleanName();
			}
		}
	}
	elsif($timer eq "short_circuit")
	{
		quest::emote("short circuits.");
		my @hate_list = $npc->GetHateList();
		my $jumps = 0;
		my $starter_target = $npc->GetHateRandom();
		my @hit_already;
		my $jump_from_target = $starter_target;
		
		if(!$starter_target)
		{
			return;
		}
		
		$starter_target->Damage($npc, 250, 1075, 24, 0);
		my $t_id = $starter_target->GetID();
		push(@hit_already, $t_id);
		
		my $hit = 1;
		
		while($hit == 1)
		{
			$hit = 0;
			foreach $hate_ent (@hate_list)
			{
				my $ent = $hate_ent->GetEnt();
				my $h_id = $ent->GetID();
				my $a_hit = 0;
				foreach $prev_id (@hit_already)
				{
					if($prev_id == $h_id)
					{
						$a_hit = 1;
						last;
					}
				}
				
				#this target can be hit
				if($a_hit == 0)
				{
					#check dist from prev target
					my $m_dist = plugin::DistNoRoot($jump_from_target, $ent);
					#if we have range, set our ent to our jump from target, do the damage, increment the jumps and add them to the already hit list
					if($m_dist < 400)
					{
						$jump_from_target = $ent;
						$jumps++;
						
						my $dmg = 250;
						for($jcount = 0; $jcount < $jumps; $jcount++)
						{
							$dmg = $dmg * 2;
						}
						$ent->Damage($npc, $dmg, 1075, 24, 0);
						
						my $h_id = $ent->GetID();
						push(@hit_already, $h_id);
					}
				}
			}
		}
	}
}

sub EVENT_DEATH
{
	quest::depopall(365026);
	quest::emote("sputters and starts to give off sparks before collapsing into a pile of broken machinery.");
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