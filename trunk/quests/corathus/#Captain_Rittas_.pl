sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("");
	}
	elsif($text=~ /Forward Base Camp/i)
	{
		quest::say("");
	}
	elsif($text=~ /Next Offensive/i)
	{
		quest::say("");
	}
	elsif($text=~ /Assignment/i)
	{
		quest::say("");
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
			quest::taskselector(@task_array);
		}
		else
		{
			quest::say("I have nothing to offer you currently.");
		}
	}
}