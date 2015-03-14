###Akkadius###
###AssignTask(UpdateType=[solo, group, raid], TaskID, [NPCID = 0] ($npc->GetID());
sub AssignTask{
	my $UT = $_[0];
	my $TaskID = $_[1];
	my $NPCID = $_[2] || 0;
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $entity_list = plugin::val('$entity_list');
	my $name = plugin::val('$name');
	
	if($UT eq "solo"){
		$client->AssignTask($TaskID, $NPCID);
	}
	
	if($UT eq "group"){
		my $group = $client->GetGroup();
		if($group)
		{
			for($count = 0; $count < 6; $count++)
			{
				my $cur = $group->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->AssignTask($TaskID, $NPCID);
					}
				}
			}
		}
	}
	
	if($UT eq "raid"){
		my $raid = $client->GetRaid();
		if($raid)
		{
			for($count = 0; $count < 72; $count++)
			{
				my $cur = $raid->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->AssignTask($TaskID, $NPCID);
					}
				}
			}
		}
		my $group = $client->GetGroup();
		if($group && !$raid)
		{
			for($count = 0; $count < 6; $count++)
			{
				my $cur = $group->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->AssignTask($TaskID, $NPCID);
					}
				}
			}
		}
	}
}

###FailTask(UpdateType=[solo, group, raid], TaskID);
sub FailTask{
	my $UT = $_[0];
	my $TaskID = $_[1];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $entity_list = plugin::val('$entity_list');
	my $name = plugin::val('$name');
	
	if($UT eq "solo"){
		$client->FailTask($TaskID);
	}
	
	if($UT eq "group"){
		my $group = $client->GetGroup();
		if($group)
		{
			for($count = 0; $count < 6; $count++)
			{
				my $cur = $group->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->FailTask($TaskID);
					}
				}
			}
		}
	}
	
	if($UT eq "raid"){
		my $raid = $client->GetRaid();
		if($raid)
		{
			for($count = 0; $count < 72; $count++)
			{
				my $cur = $raid->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->FailTask($TaskID);
					}
				}
			}
		}
		my $group = $client->GetGroup();
		if($group && !$raid)
		{
			for($count = 0; $count < 6; $count++)
			{
				my $cur = $group->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->AssignTask($TaskID, $NPCID);
					}
				}
			}
		}
	}
}

###UpdateTaskActivity(UpdateType=[solo, group, raid], TaskID, ActivityID, Count);
sub UpdateTaskActivity{
	my $UT = $_[0];
	my $TaskID = $_[1];
	my $ActivityID = $_[2];
	my $TCount = $_[3];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $entity_list = plugin::val('$entity_list');
	my $name = plugin::val('$name');
	
	if($UT eq "solo"){
		$client->UpdateTaskActivity($TaskID, $ActivityID, $TCount);
	}
	
	if($UT eq "group"){
		my $group = $client->GetGroup();
		if($group)
		{
			for($count = 0; $count < 6; $count++)
			{
				my $cur = $group->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->UpdateTaskActivity($TaskID, $ActivityID, $TCount);
					}
				}
			}
		}
	}
	
	if($UT eq "raid"){
		my $raid = $client->GetRaid();
		if($raid)
		{
			for($count = 0; $count < 72; $count++)
			{
				my $cur = $raid->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->UpdateTaskActivity($TaskID, $ActivityID, $TCount);
					}
				}
			}
		}
		my $group = $client->GetGroup();
		if($group && !$raid)
		{
			for($count = 0; $count < 6; $count++)
			{
				my $cur = $group->GetMember($count);
				if($cur)
				{
					if($cur->IsClient())
					{
						$cur->AssignTask($TaskID, $NPCID);
					}
				}
			}
		}
	}
}

return 1;