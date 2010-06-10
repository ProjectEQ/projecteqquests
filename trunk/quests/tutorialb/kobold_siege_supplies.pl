#zone: tutorialb
#npc: kobold siege supplies
#
#Quest turn in for 'Sabotage' - taskid:31
#- makeshift lantern bomb (id:86011)
#

sub EVENT_TIMER
{
	if($timer eq "explode")
	{
		my $ex = $npc->GetEntityVariable(1);
		if($ex == 1)
		{
			my $c = $entity_list->GetMobID($npc->GetEntityVariable(2));
			if($c)
			{
				$c->Message(0, "---------------------x");
			}
			$npc->SetEntityVariable(1, 2);
		}
		elsif($ex == 2)
		{
			my $c = $entity_list->GetMobID($npc->GetEntityVariable(2));
			if($c)
			{
				$c->Message(0, "-----------x");
			}
			$npc->SetEntityVariable(1, 3);
		}
		elsif($ex == 3)
		{
			my $c = $entity_list->GetMobID($npc->GetEntityVariable(2));
			if($c)
			{
				$c->Message(0, "--x");
			}
			$npc->SetEntityVariable(1, 4);
		}
		else
		{		
			quest::ze(0, "A deafening blast rips throughout the cavern as the kobold supplies explode into a ball of fire.");
			quest::stoptimer("explode");
			$npc->CameraEffect(3, 6);
			$npc->CastSpell(7477, $npc->GetID());
		}
	}
}

sub EVENT_ITEM 
{
	if(quest::istaskactivityactive(31,0) && plugin::check_handin(\%itemcount, 86011 => 1)) 
	{
		quest::updatetaskactivity(31,0);
		quest::exp(200);
		quest::ding();
		quest::settimer("explode", 2);
		$npc->SetEntityVariable(1, 1);
		$npc->SetEntityVariable(2, $client->GetID());		
	}
	else
	{
		plugin::return_items(\%itemcount);
	}
} 