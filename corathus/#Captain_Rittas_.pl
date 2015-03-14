sub EVENT_SAY
{
	my $boss_check = $entity_list->GetMobByNpcTypeID(365038);
	if(!$boss_check)
	{
		$boss_check = $entity_list->GetMobByNpcTypeID(365004);
		if(!$boss_check)
		{
			$boss_check = $entity_list->GetMobByNpcTypeID(365035);
		}
	}

	if($boss_check)
	{
		if($text=~ /Hail/i)
		{
			quest::say("Hail $name, glad to see you've made it safely to the [forward base camp].  Not long ago I was afraid we would never get get a foothold in this place.");
		}
		elsif($text=~ /Forward Base Camp/i)
		{
			quest::say("After we defeated the duke his remaining minions retreated and so we moved our camp up to this area to prepare for the [next offensive].");
		}
		elsif($text=~ /Next Offensive/i)
		{
			quest::say("Now that we've secured this area we're looking to expand our forced into the next areas controlled by the minotaurs, sporali and clockworks. Each has a commander in the area and we believe like with Duke Rumith if we destroy the commanders their forces will be routed as well. If you're ready then I may have an [assignment] for you.");
		}
		elsif($text=~ /Assignment/i)
		{
			my @task_array;
			
			my $mino = $entity_list->GetMobByNpcTypeID(365004);
			if($mino && !quest::istaskactive(147))
			{
				push(@task_array, 147);
			}
			
			my $spore = $entity_list->GetMobByNpcTypeID(365038);
			if($spore && !quest::istaskactive(148))
			{
				push(@task_array, 148);
			}
			
			my $octo = $entity_list->GetMobByNpcTypeID(365035);
			if($octo && !quest::istaskactive(149))
			{
				push(@task_array, 149);
			}
			
			my $task_array_size = @task_array;
			if($task_array_size > 0)
			{
				quest::say("These assignments are all military in nature, please return to me if you succeed in finishing one.");
				quest::taskselector(@task_array);
			}
			else
			{
				quest::say("I have nothing to offer you currently.");
			}
		}
	}
}