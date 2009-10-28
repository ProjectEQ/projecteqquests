#takes a client variable ex: @members = plugin::GetGroupMembers($client)
sub GetGroupMembers
{
	my $cl = shift;
	my @group_array;
	my $group = $cl->GetGroup();
	if($group)
	{
		for(my $count = 0; $count < 6; $count++)
		{
			my $cur = $group->GetMember($count);
			if($cur)
			{
				if($cur->IsClient())
				{
					$cur = $cur->CastToClient();
					push(@group_array, $cur);
				}
			}
		}
		return @group_array;
	}
	
	$group = $cl->GetRaid();
	if($group)
	{
		my $gid = $group->GetGroup($cl->GetName());
		print "group is $gid";
		if($gid < 0 || $gid >= 12)
		{
			push(@group_array, $cl);
			return @group_array;
		}
		
		for(my $count = 0; $count < 72; $count++)
		{
			my $cur = $group->GetMember($count);
			if($cur)
			{
				my $c_gid = $group->GetGroup($cur->GetName());
				if($c_gid == $gid)
				{
					push(@group_array, $cur);
				}
			}
		}
		return @group_array;
	}
	
	push(@group_array, $cl);
	return @group_array;
}

1;