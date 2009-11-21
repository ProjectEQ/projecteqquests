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
		if(!defined($qglobals{corathus_mushroom_daily})
		{
			quest::enabletask(146);
		}
		
		quest::disabletask(151);
		if(!defined($qglobals{corathus_jumjum_daily})
		{
			quest::enabletask(151);
		}
		
		quest::disabletask(152);
		if(!defined($qglobals{corathus_noodles_daily})
		{
			quest::enabletask(152);
		}
		
		quest::disabletask(153);
		if(!defined($qglobals{corathus_sandwich_daily})
		{
			quest::enabletask(153);
		}
		quest::taskselector(146,151,152,153);
	}
}

sub EVENT_ITEM
{
	for($i = 0; i < $itemcount{1001}; i++)
	{
		quest::updatetaskactivity(146, 0, 1);
		if(quest::istaskactivityactive(146, 1))
		{
			quest::updatetaskactivity(146, 1, 1);
			quest::setglobal("corathus_mushroom_daily", 1, 6, "H20");
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 10 + $qglobals{starshatter_points}, 6, "D30");
				my $pts = 10 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 10, 6, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 10 points to spend.");
			}
			quest::say("Great work! With this you have helped feed our troops until tomorrow.");
			return;
		}
	}
	
	for($i = 0; i < $itemcount{9654}; i++)
	{
		quest::updatetaskactivity(151, 0, 1);
		if(quest::istaskactivityactive(151, 1))
		{
			quest::updatetaskactivity(151, 1, 1);
			quest::setglobal("corathus_jumjum_daily", 1, 6, "H20");
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 10 + $qglobals{starshatter_points}, 6, "D30");
				my $pts = 10 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 10, 6, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 10 points to spend.");
			}
			quest::say("Great!! I've missed Rivervale so, this should last me a while.");
			return;
		}
	}
	
	for($i = 0; i < $itemcount{8175}; i++)
	{
		quest::updatetaskactivity(152, 0, 1);
		if(quest::istaskactivityactive(152, 1))
		{
			quest::updatetaskactivity(152, 1, 1);
			quest::setglobal("corathus_noodles_daily", 1, 6, "H20");
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 5 + $qglobals{starshatter_points}, 6, "D30");
				my $pts = 5 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 5, 6, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 5 points to spend.");
			}
			quest::say("Great work! With this you have helped feed our troops until tomorrow.");
			return;
		}
	}
	
	for($i = 0; i < $itemcount{13473}; i++)
	{
		quest::updatetaskactivity(153, 0, 1);
		if(quest::istaskactivityactive(153, 1))
		{
			quest::updatetaskactivity(153, 1, 1);
			quest::setglobal("corathus_sandwich_daily", 1, 6, "H20");
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 5 + $qglobals{starshatter_points}, 6, "D30");
				my $pts = 5 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 5, 6, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 5 points to spend.");
			}
			quest::say("Great work! With this you have helped feed our troops until tomorrow.");
			return;
		}
	}
}