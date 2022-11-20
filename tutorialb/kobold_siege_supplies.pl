#zone: tutorialb
#npc: kobold siege supplies
#
#Quest turn in for 'Sabotage' - taskid:5097
#- makeshift lantern bomb (id:86011)
#
# items: 86011

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
			$npc->CameraEffect(3000, 6);
			$npc->CastSpell(7477, $npc->GetID()); # Spell: Cazic Touch II
			$npc->Kill();
		}
	}
}

sub EVENT_ITEM 
{
	if(quest::istaskactivityactive(5097,0) && plugin::check_handin(\%itemcount, 86011 => 1)) 
	{
		quest::updatetaskactivity(5097,0);
		quest::exp(20000);
		quest::ding();
		quest::settimer("explode", 2);
		$npc->SetEntityVariable(1, 1);
		$npc->SetEntityVariable(2, $client->GetID());		
	}
	plugin::return_items(\%itemcount);
} 