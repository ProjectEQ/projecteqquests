sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::stoptimer("mushroom_throw");
		quest::stoptimer("eat_mushroom");
		quest::depopall(365073);
		quest::depopall(365074);
		quest::depopall(365075);
		quest::depopall(365076);
		quest::depopall(365077);
		quest::modifynpcstat("attack_speed", 25);
		quest::modifynpcstat("min_hit", 650);
		quest::modifynpcstat("max_hit", 1450);
	}
	else
	{
		quest::settimer("eat_mushroom", 3);
		quest::settimer("mushroom_throw", 9);
		$attack_speed = 25;
		$min_hit = 650;
		$max_hit = 1450;
	}
}

sub EVENT_TIMER
{
	if($timer eq "mushroom_throw")
	{
		my $throw_target;
		
		@hate_list = $npc->GetHateList();
		my @eligible_targets;
		foreach $hate_entry (@hate_list)
		{
			my $ent = $hate_entry->GetEnt();
			my $m_dist = plugin::Dist($npc, $ent);
			if($m_dist > 50)
			{
				push(@eligible_targets, $ent);
			}
		}
		
		my $rand_num = @eligible_targets;
		if($rand_num != 0)
		{
			my $random_index = int(rand($rand_num - 1));
			$throw_target = $eligible_targets[$random_index];
		}
		
		if(!$throw_target)
		{
			$throw_target = $npc->GetHateRandom();
			if(!$throw_target)
			{
				return;
			}
		}
		
		my $throw_name = $throw_target->GetCleanName();
		quest::emote("throws a mushroom at $throw_name.");
		
		my $random_mushroom = quest::ChooseRandom(365073,365074,365075,365076,365077);
		my $x_loc = $throw_target->GetX();
		my $y_loc = $throw_target->GetY();
		my $z_loc = $throw_target->GetZ();
		
		quest::spawn($random_mushroom, 0, 0, $x_loc, $y_loc, $z_loc);
	}
	elsif($timer eq "eat_mushroom")
	{
		my $eat_target;
		my @npc_list = $entity_list->GetNPCList();
		
		foreach $ent (@npc_list)
		{
			if($ent->GetNPCTypeID() >= 365073 && $ent->GetNPCTypeID() <= 365077)
			{
				my $m_dist = plugin::Dist($npc, $ent);
				if($m_dist < 50)
				{
					$eat_target = $ent;
					last;
				}
			}
		}
		
		if($eat_target)
		{
			my $eat_target_name = $eat_target->GetCleanName();
			quest::emote("eats $eat_target_name.");
			
			if($eat_target->GetNPCTypeID() == 365073)
			{
				quest::emote("digests a tasty mushroom and becomes faster.");
				$attack_speed = $attack_speed - 5;
				quest::modifynpcstat("attack_speed", $attack_speed);
			}
			elsif($eat_target->GetNPCTypeID() == 365074)
			{
				quest::emote("digests a tasty mushroom and regenerates.");
				$npc->HealDamage(100000);
			}
			elsif($eat_target->GetNPCTypeID() == 365075)
			{
				quest::emote("digests a paralyzing mushroom and is stunned for a moment.");
				$npc->Stun(11000);
			}
			elsif($eat_target->GetNPCTypeID() == 365076)
			{
				quest::emote("digests a tasty mushroom and grows stronger.");
				$min_hit = $min_hit * 1.2;
				quest::modifynpcstat("min_hit", $min_hit);
				$max_hit = $max_hit * 1.2;
				quest::modifynpcstat("max_hit", $max_hit);
				
			}
			elsif($eat_target->GetNPCTypeID() == 365077)
			{
				quest::emote("digests a deadly mushroom and becomes sick.");
				$npc->Damage($eat_target, 80000, 435, 24, 0);
			}
			
			$eat_target->Depop();
		}
	}
}