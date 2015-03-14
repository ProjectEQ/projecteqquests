sub EVENT_ENTERZONE
{
	if(!defined($qglobals{Wayfarer}) && $ulevel >= 15)
	{
		$client->Message(15,"A mysterious voice whispers to you, 'If you can feel me in your thoughts, know this -- something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, and find out more. Adventure awaits you, my friend.'");
	}
}

sub EVENT_TASKACCEPTED
{
	if($task_id == 146)
	{
		my $danika = $entity_list->GetMobByNpcTypeID(365147);
		if($danika)
		{
			$danika->Say("The fungus men in the area are made of a special edible fungus that I wish to use to help feed the soldiers here, return some to me and I will reward you.");
		}
	}
	elsif($task_id == 151)
	{
		my $danika = $entity_list->GetMobByNpcTypeID(365147);
		if($danika)
		{
			$danika->Say("I haven't tasted Rivervale in such a long time, bring me a piece of Rivervale and I will be forever thankful to you.");
		}
	}
	elsif($task_id == 152)
	{
		my $danika = $entity_list->GetMobByNpcTypeID(365147);
		if($danika)
		{
			$danika->Say("I need food to feed the soldiers here, bring me some noodles and I will reward you.");
		}
	}
	elsif($task_id == 153)
	{
		my $danika = $entity_list->GetMobByNpcTypeID(365147);
		if($danika)
		{
			$danika->Say("I need food to feed the soldiers here, bring me some mammoth sandwiches and I will reward you.");
		}
	}
	elsif($task_id == 154)
	{
		my $izzik = $entity_list->GetMobByNpcTypeID(365146);
		if($izzik)
		{
			$izzik->Say("This scrap will do nicely! Thank you $name, I'll need more later I imagine so please return soon.");
		}
	}
	elsif($task_id == 155)
	{
		my $izzik = $entity_list->GetMobByNpcTypeID(365146);
		if($izzik)
		{
			$izzik->Say("These bolts will do nicely! Thank you $name, I'll need more later I imagine so please return soon.");
		}
	}
	elsif($task_id == 156)
	{
		my $izzik = $entity_list->GetMobByNpcTypeID(365146);
		if($izzik)
		{
			$izzik->Say("These gizmos will do nicely! Thank you $name, I'll need more later I imagine so please return soon.");
		}
	}
}

sub EVENT_TASK_STAGE_COMPLETE
{
	if($task_id == 146)
	{
		if($activity_id == 1)
		{
			quest::setglobal("corathus_mushroom_daily", 1, 5, "H20");
			my $danika = $entity_list->GetMobByNpcTypeID(365147);
			if($danika)
			{
				$danika->Say("Great work! With this you have helped feed our troops until tomorrow.");
			}
			
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 10 + $qglobals{starshatter_points}, 5, "D30");
				my $pts = 10 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 10, 5, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 10 points to spend.");
			}
		}
	}
	elsif($task_id == 151)
	{
		if($activity_id == 0)
		{
			quest::setglobal("corathus_jumjum_daily", 1, 5, "H20");
			my $danika = $entity_list->GetMobByNpcTypeID(365147);
			if($danika)
			{
				$danika->Say("Great!! I've missed Rivervale so, this should last me a while.");
			}
			
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 10 + $qglobals{starshatter_points}, 5, "D30");
				my $pts = 10 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 10, 5, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 10 points to spend.");
			}
		}
	}
	elsif($task_id == 152)
	{
		if($activity_id == 0)
		{
			quest::setglobal("corathus_noodles_daily", 1, 5, "H20");
			my $danika = $entity_list->GetMobByNpcTypeID(365147);
			if($danika)
			{
				$danika->Say("Great work! With this you have helped feed our troops until tomorrow.");
			}
			
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 5 + $qglobals{starshatter_points}, 5, "D30");
				my $pts = 5 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 5, 5, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 5 points to spend.");
			}			
		}	
	}
	elsif($task_id = 153)
	{
		if($activity_id == 0)
		{
			quest::setglobal("corathus_sandwich_daily", 1, 5, "H20");
			my $danika = $entity_list->GetMobByNpcTypeID(365147);
			if($danika)
			{
				$danika->Say("Great work! With this you have helped feed our troops until tomorrow.");
			}
			
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 5 + $qglobals{starshatter_points}, 5, "D30");
				my $pts = 5 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 5, 5, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 5 points to spend.");
			}			
		}
	}
	elsif($task_id >= 147 && $task_id <= 149)
	{
		if($activity_id == 1)
		{
			my $captain = $entity_list->GetMobByNpcTypeID(365144);
			if($captain)
			{
				$danika->Say("Excellent soldier, your bravery is to be rewarded.");
			}
			
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", 100 + $qglobals{starshatter_points}, 5, "D30");
				my $pts = 100 + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", 100, 5, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have 100 points to spend.");
			}			
		}
	}
	elsif($task_id >= 154 && $task_id <= 156)
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
		
		my $variable_points = 10;
		if(!$boss_check)
		{
			$variable_points = 5;
		}
		
		if($activity_id == 1)
		{
			my $izzik = $entity_list->GetMobByNpcTypeID(365146);
			if($izzik)
			{
				$danika->Say("Perfect! I might need more materials later so be sure to check in.");
			}
			
			if(defined($qglobals{starshatter_points}))
			{
				quest::setglobal("starshatter_points", $variable_points + $qglobals{starshatter_points}, 5, "D30");
				my $pts = $variable_points + $qglobals{starshatter_points};
				$client->Message(15, "You have gained Starshatter points, you now have $pts points to spend.");
			}
			else
			{
				quest::setglobal("starshatter_points", $variable_points, 5, "D30");
				$client->Message(15, "You have gained Starshatter points, you now have $variable_points points to spend.");
			}			
		}
	}
}