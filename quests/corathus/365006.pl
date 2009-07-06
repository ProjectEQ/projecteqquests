my $targeted_friend;
my $mode;

sub EVENT_COMBAT
{
	if($combat_state == 0)
	{
		quest::signalwith(365057, 14, 0);
		quest::stoptimer("heal_friend_start");
		quest::stoptimer("heal_friend_end");
	}
	elsif($combat_state == 1)
	{
		quest::signalwith(365057, 13, 0);
		quest::settimer("heal_friend_start", 20);
		$mode = 0;
	}
}

sub EVENT_TIMER
{
	if($timer eq "heal_friend_start")
	{
		quest::stoptimer("heal_friend_start");
		my $lowest_hp_friend;
		my $lowest_hp = 2000000;
		my $current_npc;
		
		$current_npc = $entity_list->GetMobByNpcTypeID(365003);
		if($current_npc->GetHP() < $lowest_hp)
		{
			$lowest_hp = $current_npc->GetHP();
			$lowest_hp_friend = $current_npc;
		}
		
		$current_npc = $entity_list->GetMobByNpcTypeID(365004);
		if($current_npc->GetHP() < $lowest_hp)
		{
			$lowest_hp = $current_npc->GetHP();
			$lowest_hp_friend = $current_npc;
		}
		
		$current_npc = $entity_list->GetMobByNpcTypeID(365006);
		if($current_npc->GetHP() < $lowest_hp)
		{
			$lowest_hp = $current_npc->GetHP();
			$lowest_hp_friend = $current_npc;
		}
		
		$current_npc = $entity_list->GetMobByNpcTypeID(365020);
		if($current_npc->GetHP() < $lowest_hp)
		{
			$lowest_hp = $current_npc->GetHP();
			$lowest_hp_friend = $current_npc;
		}
		
		if($lowest_hp_friend)
		{
			$targeted_friend = $lowest_hp_friend;
			my $lhf_name = $lowest_hp_friend->GetCleanName();
			quest::Emote("begins to channel healing energy at $lhf_name.");
			quest::settimer("heal_friend_end", 8);
			$mode = 1;
		}
		else
		{
			quest::settimer("heal_friend_start", 20);
			$mode = 0;
		}
	}
	
	if($timer eq "heal_friend_end")
	{
		if($targeted_friend)
		{
			if($mode == 1)
			{
				my $lhf_name = $targeted_friend->GetCleanName();
				quest::Emote("heals $lhf_name");
				$targeted_friend->HealDamage(200000, $npc);
				quest::stoptimer("heal_friend_end");
				quest::settimer("heal_friend_start", 20);
				$mode = 0;
			}
		}
		else
		{
			quest::Emote("becomes frustrated as her healing energy fizzles.");
			quest::stoptimer("heal_friend_end");
			quest::settimer("heal_friend_start", 20);
			$mode = 0;
		}
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("heal_friend_start");
	quest::stoptimer("heal_friend_end");
	quest::signalwith(365057, 15, 0);
}

sub EVENT_CAST_ON
{
	if($npc->IsEngaged())
	{
		if($client)
		{
			if($mode == 1)
			{
				my $ret_val = quest::IsEffectInSpell($spell_id, 21);
				if($ret_val == 1)
				{
					quest::Emote("becomes frustrated as her healing energy fizzles.");
					quest::stoptimer("heal_friend_end");
					quest::settimer("heal_friend_start", 20);
					$mode = 0;
				}
			}
		}
	}
}