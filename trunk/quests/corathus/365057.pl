#council trigger
my $number_alive;
my $in_combat;

sub EVENT_SPAWN
{
	quest::settimer("try_spawn", 5);
	quest::settimer("flavor_text", 8);
	$number_alive = 0;
	$in_combat = 0;
}

sub EVENT_TIMER
{
	if($timer eq "try_spawn")
	{
		my $current_boss = $entity_list->GetMobByNpcTypeID(365019);
		if(!$current_boss)
		{
			$current_boss = $entity_list->GetMobByNpcTypeID(365035);
			if(!$current_boss)
			{
				$current_boss = $entity_list->GetMobByNpcTypeID(365038);
				if(!$current_boss)
				{
					$current_boss = $entity_list->GetMobByNpcTypeID(365038);
					if(!$current_boss)
					{
						$current_boss = $entity_list->GetMobByNpcTypeID(365038);
						if(!$current_boss)
						{
							$current_boss = $entity_list->GetMobByNpcTypeID(365032);
						}
					}
				}
			}
		}
		
		if(!$current_boss)
		{
			quest::stoptimer("try_spawn");
			quest::depopall(365002);
			quest::depopall(365003);
			quest::depopall(365004);
			quest::depopall(365006);
			quest::depopall(365020);
			quest::spawn2(365002, 0, 0, -24.2, 21.4, -23.4, 110);
			quest::spawn2(365003, 0, 0, -32.9, 13.4, -23.4, 84.6);
			quest::spawn2(365004, 0, 0, -35.4, 1.4, -23.4, 63.9);
			quest::spawn2(365006, 0, 0, -22.1, -13.1, -23.4, 9.9);
			quest::spawn2(365020, 0, 0, -30.1, -10.1, -23.4, 24.2);
			$number_alive = 5;
			$in_combat = 0;
		}
	}
	
	if($timer eq "flavor_text")
	{
		if($in_combat == 0)
		{
			my $random_npc = quest::ChooseRandom(365003, 365004, 365006, 365020);
			quest::signalwith($random_npc, 5, 0);
		}
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_spawn");
}

sub EVENT_SIGNAL
{
	#signals:
	#1 = king engage
	#2 = king disengage
	#3 = king dead
	#4= duke engage
	#5 = duke disengage
	#6 = duke dead
	#7 = gen_one engage
	#8 = gen_one disengage
	#9 = gen_one dead
	#10 = gen_two engage
	#11 = gen_two disengage
	#12 = gen_two dead
	#13 = fairy engage
	#14 = fairy disengage
	#15 = fairy dead
	if($signal == 2 || $signal == 5 || $signal == 8 || $signal == 11 || $signal == 14)
	{
		if($in_combat == 1)
		{
			$in_combat = 0;
			quest::depopall(365002);
			quest::depopall(365003);
			quest::depopall(365004);
			quest::depopall(365006);
			quest::depopall(365020);
			quest::spawn2(365002, 0, 0, -24.2, 21.4, -23.4, 110);
			quest::spawn2(365003, 0, 0, -32.9, 13.4, -23.4, 84.6);
			quest::spawn2(365004, 0, 0, -35.4, 1.4, -23.4, 63.9);
			quest::spawn2(365006, 0, 0, -22.1, -13.1, -23.4, 9.9);
			quest::spawn2(365020, 0, 0, -30.1, -10.1, -23.4, 24.2);
			$number_alive = 5;
		}
	}
	
	if($signal == 1 || $signal == 4 || $signal == 7 || $signal == 10 || $signal == 13)
	{
		if($in_combat == 0)
		{
			$in_combat = 1;
		}
	}
	
	if($signal == 3 || $signal == 6 || $signal == 9 || $signal == 12 || $signal == 15)
	{
		$number_alive--;
		if($number_alive == 1)
		{
			#put the loot on the last one alive...
			my $check_alive = $entity_list->GetMobByNpcTypeID(365002);
			if($check_alive)
			{
				#my $loot_choice =  quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
				#$npc->AddItem($loot_choice, 1);
				#$loot_choice =  quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
				#$npc->AddItem($loot_choice, 1);
				#$loot_choice =  quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
				#$npc->AddItem($loot_choice, 1);
				#$loot_choice =  quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
				#$npc->AddItem($loot_choice, 1);
				#$loot_choice =  quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10);
				#$npc->AddItem($loot_choice, 1);
				return;
			}
			
			$check_alive = $entity_list->GetMobByNpcTypeID(365003);
			if($check_alive)
			{
				#add loot
				return;
			}

			$check_alive = $entity_list->GetMobByNpcTypeID(365004);
			if($check_alive)
			{
				#add loot
				return;
			}

			$check_alive = $entity_list->GetMobByNpcTypeID(365006);
			if($check_alive)
			{
				#add loot
				return;
			}

			$check_alive = $entity_list->GetMobByNpcTypeID(365020);
			if($check_alive)
			{
				#add loot
				return;
			}			
		}
		elsif($number_alive == 0)
		{
			#this event is down so kill us so we respawn like normal.
			$npc->Kill();
		}
	}
}