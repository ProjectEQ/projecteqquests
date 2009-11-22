sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("'ello I am Danika, I hail from the MIGHTY town of Rivervale! I am a fierce fighter by spirit but a [trader] by reputation, if there's anything you need just let me know.");
	}
	elsif($text=~ /Trader/i)
	{
		quest::emote("smiles.");
		quest::say("Yes! I trade a great many goods with all sorts of people, if you wish I'm always looking for more people to [trade with].");
	}
	elsif($text=~ /Trade With/i)
	{
		my @task_array;
		if(!defined($qglobals{corathus_mushroom_daily}) && !quest::istaskactive(146))
		{
			push(@task_array, 146);
		}
		
		if(!defined($qglobals{corathus_jumjum_daily}) && !quest::istaskactive(151))
		{
			push(@task_array, 151);
		}
		
		if(!defined($qglobals{corathus_noodles_daily}) && !quest::istaskactive(152))
		{
			push(@task_array, 152);
		}
		
		if(!defined($qglobals{corathus_sandwich_daily}) && !quest::istaskactive(153))
		{
			push(@task_array, 153);
		}
		
		if($task_array > 0)
		{
			quest::taskselector(@task_array);
		}
		else
		{
			quest::say("I don't have any work for you right now, check back later!");
		}
	}
	
	$qglobals{starshatter_points} = undef;
	$qglobals{corathus_mushroom_daily} = undef;
	$qglobals{corathus_jumjum_daily} = undef;
	$qglobals{corathus_noodles_daily} = undef;
	$qglobals{corathus_sandwich_daily} = undef;
}