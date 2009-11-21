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
		quest::disabletask(146);
		if(!defined($qglobals{corathus_mushroom_daily}))
		{
			quest::enabletask(146);
		}
		
		quest::disabletask(151);
		if(!defined($qglobals{corathus_jumjum_daily}))
		{
			quest::enabletask(151);
		}
		
		quest::disabletask(152);
		if(!defined($qglobals{corathus_noodles_daily}))
		{
			quest::enabletask(152);
		}
		
		quest::disabletask(153);
		if(!defined($qglobals{corathus_sandwich_daily}))
		{
			quest::enabletask(153);
		}
		quest::taskselector(146,151,152,153);
	}
}