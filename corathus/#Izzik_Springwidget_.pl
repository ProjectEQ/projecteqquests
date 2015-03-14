sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("Hail, friend, Izzik's my name and [tinkering] is my game.");
	}
	elsif($text=~ /Tinkering/i)
	{
		quest::say("Oh yes I love to tinker, so did Wilfred but I'm afraid he's past that now. It's sort of [unfortunate]...");
	}
	elsif($text=~ /Unfortunate/i)
	{
		quest::say("Well you see I love to tinker like no one else around, but supplies around here are short. Most of the robots we just destroyed were not well maintained and salvaging them didn't get me much. There are some clockworks to the south that if you were to [assist] me in salvaging I would reward you for.");
	}
	elsif($text=~ /Assist/i)
	{
		my @task_array;
		if(!defined($qglobals{corathus_scrap_daily}) && !quest::istaskactive(154))
		{
			push(@task_array, 154);
		}
		
		if(!defined($qglobals{corathus_bolt_daily}) && !quest::istaskactive(155))
		{
			push(@task_array, 155);
		}
		
		if(!defined($qglobals{corathus_gizmo_daily}) && !quest::istaskactive(156))
		{
			push(@task_array, 156);
		}

		my $task_array_size = @task_array;
		if($task_array_size > 0)
		{
			quest::taskselector(@task_array);
		}
		else
		{
			quest::say("I don't have any work for you right now, check back later!");
		}
	}
}