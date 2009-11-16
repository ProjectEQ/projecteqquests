sub EVENT_SPAWN
{
	quest::settimer("try_sit", 10);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
		quest::stoptimer("try_sit");
	}
}

sub EVENT_SAY
{
	if($client->GetLevel() >= 55)
	{
		if($text=~ /Hail/i)
		{
			if(quest::istaskactive(145))
			{
				if(quest::istaskactivityactive(145, 1))
				{
					quest::say("You've briefly granted us some rest from the onslaught of the minotaurs, for that I thank you.");
					quest::updatetaskactivity(145, 1, 1);
					quest::setglobal("corathus_mino_daily", 1, 6, "H20");
					if(defined($qglobals{starshatter_points})
					{
						quest::setglobal("starshatter_points", 10 + $qglobals{starshatter_points}, 6, "D30");
					}
					else
					{
						quest::setglobal("starshatter_points", 10, 6, "D30");
					}
					
					my $sspts = $qglobals{starshatter_points};
					$client->Message(0, "You have gained Starshatter points, you now have $sspts to spend.");
				}
			}
			else
			{
				quest::say("My weary bones ache, we need a [reprieve] from these assaults.");
			}
		}
		elsif($text=~ /reprieve/i)
		{
			if(defined($qglobals{corathus_mino_daily}))
			{
				quest::say("You've briefly granted us some rest from the onslaught of the minotaurs, for that I thank you.");
			}
			else
			{
				quest::say("If you wish to earn my thanks then go out and [slay the minotaurs]. If you return to me alive I will reward you.");
			}
		}
		elsif($text=~ /slay the minotaurs/i)
		{
			if(defined($qglobals{corathus_mino_daily}))
			{
				quest::say("You've briefly granted us some rest from the onslaught of the minotaurs, for that I thank you.");
			}
			else
			{
				if(quest::istaskactive(145) == 0)
				{
					quest::assigntask(145);
				}
			}
		}
	}
	else
	{
		if($text=~ /Hail/i)
		{
			quest::say("My weary bones ache, we need a reprieve from these assaults, but I am afraid you are far too inexperienced to help right now.");
		}
	}
}