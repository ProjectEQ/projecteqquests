#::: Author: Trevius
#::: Description: Returns Group members or Raid members if present
#::: Usage: takes a client variable ex: @members = plugin::GetGroupMembers($client)

sub GetGroupMembers{
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
					# this is cast-safe..but, does not account for mercenaries/bots (divergent behavior from system code)
					$cur = $cur->CastToClient();
					push(@group_array, $cur);
				}
			}
		}
		return @group_array;
	}
	
	$group = $cl->GetRaid();
	if($group){
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

#::: Author: Akkadius
#::: Description: Used in conjuction with Instance plugin

sub GetGroupID{ 
	my $client = plugin::val('$client');
	my $ClientGroup = $client->GetGroup();
	if ($ClientGroup){ my $GroupID = $ClientGroup->GetID(); return $GroupID; }
	else{ $GroupID = undef; }
}

#::: Author: ?
#::: Description: Used in conjuction with Instance plugin

sub CastGroupSpell{
	my $cl = shift;
	my $caster = shift;
	my $spell_id = shift;
	
	my $group = $cl->GetGroup();
	if($group){
		$group->CastGroupSpell($caster, $spell_id);
		return;
	}
	
	$group = $cl->GetRaid();
	if($group){
		$group->CastGroupSpell($caster, $spell_id);
		return;
	}	
}

#::: Author: ?
#::: Description: Moves group to destination
#::: Usage: plugin::MoveGroup(zoneid, x, y, z, h)

sub MoveGroup{
	my $cl = shift;
	my $zone_id = shift;
	my $x_dest = shift;
	my $y_dest = shift;
	my $z_dest = shift;
	my $heading_dest = shift;
	my @group_array = plugin::GetGroupMembers($cl);
	
	foreach $ent (@group_array)
	{
		if($ent)
		{
			$ent->MovePC($zone_id, $x_dest, $y_dest, $z_dest, $heading_dest);
		}
	}
}

#::: Author: ?
#::: Description: Moves group to destination instance
#::: Usage: plugin::MoveGroupInstance(zoneid, instanceid, x, y, z, h)

sub MoveGroupInstance{
	my $cl = shift;
	my $zone_id = shift;
	my $instance_id = shift;
	my $x_dest = shift;
	my $y_dest = shift;
	my $z_dest = shift;
	my $heading_dest = shift;
	my @group_array = plugin::GetGroupMembers($cl);
	
	foreach $ent (@group_array)
	{
		if($ent)
		{
			$ent->MovePC($zone_id, $instance_id, $x_dest, $y_dest, $z_dest, $heading_dest);
		}
	}
}

# Usage: plugin::CastOnGroup(SpellID, MaxDist=0, Client=$client);
# This script will cast the spell on the client's group from an NPC (such as a buff bot).
# SpellID - This is just the spell ID to be cast.
# MaxDist - This is an optional field for setting the Max Distance for the spell to land on group members.
# The Default 0 setting for MaxDist disables the check for distance so it will be cast on all group members in zone.
# Client - This is an optional field to set a specific client to cast buffs on their group (Default is the client interacting with the NPC)

sub CastOnGroup {
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $entity_list = plugin::val('$entity_list');
	my $SpellID = $_[0];
	my $MaxDist = $_[1];
	my $Caster = $_[2];

	#plugin::Debug("If the caster field was not set, use the client interacting with the NPC as the caster");
	if (!$Caster){
		$Caster = $client;
	}
	
	my $ClientGroup = $client->GetGroup();
	
	#plugin::Debug("If the client is grouped");
	if ($ClientGroup){
		#plugin::Debug("Cycle through all 6 possible group members");
		my $GCount = 0;
		while ($GCount < 6)
		{
			$GroupMember = $ClientGroup->GetMember($GCount);
			#plugin::Debug("If this group member exists");
			if ($GroupMember)
			{
				my $OutOfRange = 0;
				#plugin::Debug("If MaxDist was set, make sure the client is within the desired range");
				if ($MaxDist)
				{
					my $ClientX = $GroupMember->GetX();
					my $ClientY = $GroupMember->GetY();
					my $ClientZ = $GroupMember->GetZ();
					my $ClientDist = $npc->CalculateDistance($ClientX, $ClientY, $ClientZ);
					#plugin::Debug("Check if the Square Root of the Distance from NPC to Client is less than MaxDist");
					# CalculateDistance returns squared distance
					if (sqrt($ClientDist) > $MaxDist)
					{
						$OutOfRange = 1;
					}
				}
				
				#plugin::Debug("If they aren't out of range or range was not specified");
				if (!$OutOfRange)
				{
					my $MemberID = $GroupMember->GetID();
					#plugin::Debug("Cast the spell on this member");
					#$npc->CastSpell($SpellID, $MemberID);
					$npc->SpellFinished($SpellID, $GroupMember, 0);
					my $PetID = $GroupMember->GetPetID();
					#plugin::Debug("Check if this member has a pet and if so, cast it on the pet as well");
					if ($PetID)
					{
						#$npc->CastSpell($SpellID, $PetID);
						$npc->SpellFinished($SpellID, $entity_list->GetMobByID($PetID), 0);

					}
				}
			
			}
			$GCount++;
		}
	}
	else
	{
		#plugin::Debug("Client is not grouped, so just cast on them");
		my $CasterID = $Caster->GetID();
		#$npc->CastSpell($SpellID, $CasterID);
		$npc->SpellFinished($SpellID, $Caster, 0);
		my $PetID = $Caster->GetPetID();
		#plugin::Debug("Check if the client has a pet and if so, cast it on the pet as well");
		if ($PetID)
		{
			#$npc->CastSpell($SpellID, $PetID);
			$npc->SpellFinished($SpellID, $entity_list->GetMobByID($PetID), 0);
		}
	}

}

#::: Author: Akkadius
#::: Description: Messages group
#::: Usage: plugin::MessageGroup(color, message)

sub MessageGroup{
	my $Color = $_[0];
	my $Message = $_[1];
	my $client = plugin::val('$client');
	my @group_array = plugin::GetGroupMembers($client);
	
	foreach $ent (@group_array) {
		if($ent) {
			$ent->Message($Color, $Message);
		}
	}
}

1;