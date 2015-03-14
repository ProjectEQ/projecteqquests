#Usage: plugin::FollowFormLeader([LeaderMob, OnGrid = 0, MoveToX = 0, MoveToY = 0, NoSpeedBuffs = false]);
# This script will move all of 1 NPC Type ID to the relative Guard position that they were the first time this plugin was run
# LeaderMob is an optional field where a specific leader NPC can be specified (default is the NPC running the script)
# OnGrid is am optional field where 1 will use NPC waypoints if they are on a grid, and 0 (default) will use guard or set XYZ
# MoveToX/MoveToY/MoveToZ are optional fields for setting a destination X Y and Z instead of using guard points or way points to determine the destination.
# At this time, the MoveToZ field is basically ignored, as the ground Z is calculated based on the leader NPC's Z.
# NoSpeedBuffs is an optional field for all speedbuffs to be removed during pathing if enabled

sub FollowFormLeader {
	my $npc = plugin::val('$npc');
	my $entity_list = plugin::val('$entity_list');
	my $Mob = $_[0];
	my $OnGrid = $_[1];
	my $MoveToX = $_[2];
	my $MoveToY = $_[3];
	my $NoSpeedBuffs = $_[4];
	if (!$Mob) { $Mob = $npc; }
	
	if (!$MoveToX && !$MoveToY && !$MoveToZ)
	{
		if (!$OnGrid)
		{
			$MoveToX = $Mob->GetGuardPointX();
			$MoveToY = $Mob->GetGuardPointY();
		}
		else
		{
			$MoveToX = $Mob->GetWaypointX();
			$MoveToY = $Mob->GetWaypointY();
		}
	}
	my $NewHeading = $Mob->CalculateHeadingToTarget($MoveToX, $MoveToY);
	if ($NoSpeedBuffs)
	{
		$Mob->BuffFadeByEffect(3);	# Prevent Speed buffs from messing up the group of NPCs
	}
	my $LeaderID = $Mob->GetID();
	my @npclist = $entity_list->GetNPCList();
	foreach $ent (@npclist)
	{
		if($ent->EntityVariableExists(52) && $ent->GetEntityVariable(52) == $LeaderID)
		{
			#plugin::Debug("Got NPC");
			if ($NoSpeedBuffs)
			{
				$ent->BuffFadeByEffect(3);	# Prevent Speed buffs from messing up the group of NPCs
			}
			
			# Set the Initial Relative Position and Heading variables
			if(!$ent->EntityVariableExists(50))
			{
				# If this doesn't exist, then neither of them do
				my $SquadX = $ent->GetX();
				my $SquadY = $ent->GetY();
				my $SquadHeading = $Mob->CalculateHeadingToTarget($SquadX, $SquadY);
				my $CurHeading = $Mob->GetHeading();
				my $CurDist = plugin::DistNoZ($Mob, $ent);
				my $HeadingDiff = 0;
				if ($CurHeading > $SquadHeading)
				{
					$HeadingDiff = $CurHeading - $SquadHeading;
				}
				else
				{
					$HeadingDiff = $CurHeading + 256 - $SquadHeading;
				}
				$ent->SetEntityVariable(50, $CurDist);	# Original Distance from Leader
				$ent->SetEntityVariable(51, $HeadingDiff);	# Original Heading Difference from Leader
			}
			my $SquadDist = $ent->GetEntityVariable(50);
			my $HDiff = $ent->GetEntityVariable(51);
			#plugin::Debug("Got Variables");
			
			my $NewSquadHeading = 0;
			if ($NewHeading - $HDiff > 0)
			{
				$NewSquadHeading = $NewHeading - $HDiff;
			}
			else
			{
				$NewSquadHeading = 256 + $NewHeading - $HDiff;
			}
			#plugin::Debug("Before Calc");
			my @DestArray = plugin::CalcDestFromHeadingXY($NewSquadHeading, $SquadDist, $MoveToX, $MoveToY, 10, $Mob);
			my $NewX = $DestArray[0];
			my $NewY = $DestArray[1];
			my $NewZ = $DestArray[2];
			#plugin::Debug("After Calc");
			$ent->MoveTo($NewX, $NewY, $NewZ, $NewHeading, 1);
			#plugin::Debug("Moving NPC");
		}
	}
}


#Usage: plugin::MoveInFormation(NPCID, [$npc = 0, OnGrid = 0, MoveToX = 0, MoveToY = 0, NoSpeedBuffs = false]);
# This script will move all of 1 NPC Type ID to the relative Guard position that they were the first time this plugin was run
# NPCID is the NPC ID of the NPCs you want to move in the formation (moves all of this NPC ID in the whole zone)
# $npc is an optional field where a specific leader NPC can be specified (default is the NPC running the script)
# OnGrid is am optional field where 1 will use NPC waypoints if they are on a grid, and 0 (default) will use guard or set XYZ
# MoveToX/MoveToY/MoveToZ are optional fields for setting a destination X Y and Z instead of using guard points or way points to determine the destination.
# At this time, the MoveToZ field is basically ignored, as the ground Z is calculated based on the leader NPC's Z.
# NoSpeedBuffs is an optional field for all speedbuffs to be removed during pathing if enabled

sub MoveInFormation {
	my $npc = plugin::val('$npc');
	my $entity_list = plugin::val('$entity_list');
	my $SquadNPCID = $_[0];
	my $Mob = $_[1];
	my $OnGrid = $_[2];
	my $MoveToX = $_[3];
	my $MoveToY = $_[4];
	my $NoSpeedBuffs = $_[5];
	if (!$Mob) { $Mob = $npc; }
	
	if (!$MoveToX && !$MoveToY && !$MoveToZ)
	{
		if (!$OnGrid)
		{
			$MoveToX = $Mob->GetGuardPointX();
			$MoveToY = $Mob->GetGuardPointY();
			#$MoveToZ = $Mob->GetGuardPointZ();
			#plugin::Debug("Using Guard Locs");
		}
		else
		{
			#GetWaypointX(), GetWaypointY(), GetWaypointZ(), GetWaypointH(), GetWaypointPause(), and GetWaypointID().
			#$Mob->CalculateNewWaypoint();
			#my $WPID = int($Mob->GetWaypointID());
			#my $WPPause = int($Mob->GetWaypointPause());
			#my $CurX = int($Mob->GetX());
			#my $CurY = int($Mob->GetY());
			$MoveToX = $Mob->GetWaypointX();
			$MoveToY = $Mob->GetWaypointY();
			#$MoveToZ = $Mob->GetWaypointZ();
			#plugin::Debug("Using WP:$WPID Pause:$WPPause WPX:$MoveToX WPY:$MoveToY CurX:$CurX CurY:$CurY");
		}
	}
	my $NewHeading = $Mob->CalculateHeadingToTarget($MoveToX, $MoveToY);
	if ($NoSpeedBuffs)
	{
		$Mob->BuffFadeByEffect(3);	# Prevent Speed buffs from messing up the group of NPCs
	}
	
	my @npclist = $entity_list->GetNPCList();
	foreach $ent (@npclist)
	{
		if($ent->GetNPCTypeID() == $SquadNPCID)
		{
			#plugin::Debug("Got NPC");
			if ($NoSpeedBuffs)
			{
				$ent->BuffFadeByEffect(3);	# Prevent Speed buffs from messing up the group of NPCs
			}
			
			# Set the Initial Relative Position and Heading variables
			if(!$ent->EntityVariableExists(50))
			{
				# If this doesn't exist, then neither of them do
				my $SquadX = $ent->GetX();
				my $SquadY = $ent->GetY();
				my $SquadHeading = $Mob->CalculateHeadingToTarget($SquadX, $SquadY);
				my $CurHeading = $Mob->GetHeading();
				my $CurDist = plugin::DistNoZ($Mob, $ent);
				my $HeadingDiff = 0;
				if ($CurHeading > $SquadHeading)
				{
					$HeadingDiff = $CurHeading - $SquadHeading;
				}
				else
				{
					$HeadingDiff = $CurHeading + 256 - $SquadHeading;
				}
				$ent->SetEntityVariable(50, $CurDist);	# Original Distance from Leader
				$ent->SetEntityVariable(51, $HeadingDiff);	# Original Heading Difference from Leader
			}
			my $SquadDist = $ent->GetEntityVariable(50);
			my $HDiff = $ent->GetEntityVariable(51);
			#plugin::Debug("Got Variables");
			
			my $NewSquadHeading = 0;
			if ($NewHeading - $HDiff > 0)
			{
				$NewSquadHeading = $NewHeading - $HDiff;
			}
			else
			{
				$NewSquadHeading = 256 + $NewHeading - $HDiff;
			}
			#plugin::Debug("Before Calc");
			my @DestArray = plugin::CalcDestFromHeadingXY($NewSquadHeading, $SquadDist, $MoveToX, $MoveToY, 10, $Mob);
			my $NewX = $DestArray[0];
			my $NewY = $DestArray[1];
			my $NewZ = $DestArray[2];
			#plugin::Debug("After Calc");
			$ent->MoveTo($NewX, $NewY, $NewZ, $NewHeading, 1);
			#plugin::Debug("Moving NPC");
		}
	}
}


#Usage: plugin::MoveToFormation(NPCID, LeaderMob, Distance, Columns, Rows, [LeadDist, MaxZDiff]);
# NPCID is the NPC Type ID of the NPCs you want to form the squad formation with
# LeaderMob is the Client or NPC you want to spawn the formation behind (use invisible and/or temp NPC to show no leader)
# Distance is the distance each member of the formation will be from each other on both axis
# Columns is the number of columns you want in the formation
# Rows is the number of rows you want in the formation
# LeadDist is the distance you want the formation to be created behind the leader
# MaxZDiff is the maximum height above the leader that the best Z will be searched for

sub MoveToFormation {
	my $NPCID = $_[0];
	my $Mob = $_[1];
	my $Distance = $_[2];
	my $Columns = $_[3];
	my $Rows = $_[4];
	my $LeadDist = $_[5];
	my $MaxZDiff = $_[6];
	
	if (!$MaxZDiff)
	{
		$MaxZDiff = 15;
	}
	
	if (!$LeadDist)
	{
		$LeadDist = $Distance;
	}
	
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $entity_list = plugin::val('$entity_list');
	
	if (!$Mob) { 
		if ($npc->IsNPC())
		{
			$Mob = $npc;
		}
		elsif ($client->IsClient())
		{
			$Mob = $client;
		}
		else
		{
			return; # No Client or NPC found
		}
	}
	
	my $SpawnX = $Mob->GetX();
	my $SpawnY = $Mob->GetY();
	my $SpawnZ = $Mob->GetZ();

	my $LeaderHeading = $Mob->GetHeading();
	$SpawnX = $SpawnX + $LeadDist;
	$SpawnY = $SpawnY - (($Columns - 1) * $Distance / 2);

	my $NewX = $SpawnX;
	my $NewY = $SpawnY;
	
	my @npclist = $entity_list->GetNPCList();
	my @SquadNPCs = (); # Creates a cleared array
	foreach $ent (@npclist)
	{
		if($ent->GetNPCTypeID() == $NPCID) {
			#plugin::Debug("Found a matching NPC");
			push(@SquadNPCs, $ent->GetID());	# Adds an element to the end of the array
			#plugin::Debug("Added the NPC to the list");
		}
	}

	my $ArrayEntry = 0;
	for ($ColNum = 0; $ColNum < $Columns; $ColNum++)
	{
		#plugin::Debug("Column $ColNum");
		for ($RowNum = 0; $RowNum < $Rows; $RowNum++)
		{
			#plugin::Debug("Row $RowNum");
			my $SquadHeading = $Mob->CalculateHeadingToTarget($NewX, $NewY);
			my $CurDist = plugin::DistNoZToCoords($Mob, $NewX, $NewY);
			my $DestH = 0;
			
			if ($LeaderHeading > ($SquadHeading - 64))
			{
				$DestH = $LeaderHeading - $SquadHeading - 64;
			}
			else
			{
				$DestH = 256 + $LeaderHeading - $SquadHeading - 64;
			}
			
			my @DestArray = plugin::CalcDestFromHeading($DestH, $CurDist, $Mob, $MaxZDiff);
			my $DestX = $DestArray[0];
			my $DestY = $DestArray[1];
			my $DestZ = $DestArray[2];

			my $ArrayNPC = $SquadNPCs[$ArrayEntry];
			my $CurNPC = $entity_list->GetNPCByID($ArrayNPC);
			$CurNPC->MoveTo($DestX, $DestY, $DestZ, $LeaderHeading, 1);
			my $NewSquadHeading = $Mob->CalculateHeadingToTarget($DestX, $DestY);
			my $HeadingDiff = 0;
			if ($LeaderHeading > $NewSquadHeading) {
				$HeadingDiff = $LeaderHeading - $NewSquadHeading;
			}
			else {
				$HeadingDiff = $LeaderHeading + 256 - $NewSquadHeading;
			}
			$CurNPC->SetEntityVariable(50, $CurDist);	# Original Distance from Leader
			$CurNPC->SetEntityVariable(51, $HeadingDiff);	# Original Heading Difference from Leader
			$NewX = $NewX + $Distance;
			$ArrayEntry++;
		}
		$NewY = $NewY + $Distance;
		$NewX = $SpawnX;
	}

}


#Usage: plugin::RandomFormRoam(MaxVariance, MaxZVariance, LoSMobSize);
# NPCID is the NPC Type ID of the NPCs you want to form the squad formation with
# MaxVariance - Sets the max X/Y variance to travel 
# MaxZVariance - Sets the max Z variance to travel.  This field is optional and default is 15.
# LoSMobSize - Sets the size of the mob LoS check.  This field is optional and default is 5.
# The LoS check basically looks from your NPC to an imaginary NPC of the LoSMobSize size to see if LoS exists

sub RandomFormRoam {

	my $npc = plugin::val('$npc');
	my $entity_list = plugin::val('$entity_list');
	#my $NPCID = $_[0];
	my $MaxVariance = $_[0];
	my $MaxZVariance = $_[1];
	my $LoSMobSize = $_[2];

	#Set the Max Z Variance to 15 if no 3rd argument is set
	if(!$MaxZVariance)
	{
		$MaxZVariance = 15;
	}
	
	#Set the LoS Check Mob Size to 5 if no 4th argument is set
	if(!$LoSMobSize)
	{
		$LoSMobSize = 5;
	}
	
	# Don't try to roam if already engaged in combat!
	if ($npc->IsEngaged() != 1)
	{
		#Get needed Locs
		my $CurX = $npc->GetX();
		my $CurY = $npc->GetY();
		#my $CurZ = $npc->GetZ();	#Not currently required by this plugin
		my $OrigX = $npc->GetSpawnPointX();
		my $OrigY = $npc->GetSpawnPointY();
		my $OrigZ = $npc->GetSpawnPointZ();
		my $GuardX = $npc->GetGuardPointX();
		my $GuardY = $npc->GetGuardPointY();

		if ($CurX == $GuardX && $CurY == $GuardY)
		{
			#If the NPC has finished walking to the previous given Loc
			#plugin::Debug("My Guard X is $GuardX and Y is $GuardY");
			#Get a random X and Y within the set range
			my $RandomX = int(rand($MaxVariance - 1)) + 1;
			my $RandomY = int(rand($MaxVariance - 1)) + 1;
			my $PosX = $OrigX + $RandomX;
			my $PosY = $OrigY + $RandomY;
			my $NegX = $OrigX - $RandomX;
			my $NegY = $OrigY - $RandomY;
			my $NewX = quest::ChooseRandom($PosX, $NegX);
			my $NewY = quest::ChooseRandom($PosY, $NegY);
			
			#Check for LoS and Z issues before moving to the new Loc
			my $NewZ = $npc->FindGroundZ($NewX,$NewY, 5) + 1;	#Add 1 to the new Z to prevent hopping issue when they arrive
			if ($NewZ > -999999 && $OrigZ > ($NewZ - $MaxZVariance + 1) && $OrigZ < ($NewZ + $MaxZVariance - 1))
			{
				my $NewH = $npc->CalculateHeadingToTarget($NewX, $NewY);
				my $LoS_Check = $npc->CheckLoSToLoc($NewX, $NewY, $NewZ, $LoSMobSize);
				#Check LoS to the new random Loc
				if ($LoS_Check)
				{
					quest::moveto($NewX, $NewY, $NewZ, $NewH, 1);
					#plugin::MoveInFormation($NPCID, $npc, 0, $NewX, $NewY);
					plugin::FollowFormLeader($npc, 0, $NewX, $NewY);
				}
				else
				{
					# If the NPC is not at its spawn point, return to it to prevent getting stuck
					if ($OrigX != $CurX || $OrigY != $CurY)
					{
						quest::moveto($OrigX, $OrigY, $OrigZ, $NewH, 1);
						plugin::FollowFormLeader($npc, 0, $NewX, $NewY);
					}
				}
			}
		}
	}
}


#Usage: plugin::SpawnInFormation(NPCID, LeaderMob, Distance, Columns, Rows, [LeadDist, MaxZDiff]);
# NPCID is the NPC Type ID of the NPCs you want to form the squad formation with
# LeaderMob is the Client or NPC you want to spawn the formation behind (use invisible and/or temp NPC to show no leader)
# Distance is the distance each member of the formation will be from each other on both axis
# Columns is the number of columns you want in the formation
# Rows is the number of rows you want in the formation
# LeadDist is the distance you want the formation to be created behind the leader
# MaxZDiff is the maximum height above the leader that the best Z will be searched for

sub SpawnInFormation {
	my $NPCID = $_[0];
	my $Mob = $_[1];
	my $Distance = $_[2];
	my $Columns = $_[3];
	my $Rows = $_[4];
	my $LeadDist = $_[5];
	my $MaxZDiff = $_[6];
	
	if (!$MaxZDiff)
	{
		$MaxZDiff = 15;
	}
	
	if (!$LeadDist)
	{
		$LeadDist = $Distance;
	}
	
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $entity_list = plugin::val('$entity_list');
	
	if (!$Mob) { 
		if ($npc->IsNPC())
		{
			$Mob = $npc;
		}
		elsif ($client->IsClient())
		{
			$Mob = $client;
		}
		else
		{
			return; # No Client or NPC found
		}
	}
	
	my $SpawnX = $Mob->GetX();
	my $SpawnY = $Mob->GetY();
	my $SpawnZ = $Mob->GetZ();

	my $LeaderHeading = $Mob->GetHeading();
	$SpawnX = $SpawnX + $LeadDist;
	$SpawnY = $SpawnY - (($Columns - 1) * $Distance / 2);

	my $NewX = $SpawnX;
	my $NewY = $SpawnY;

	for ($ColNum = 0; $ColNum < $Columns; $ColNum++)
	{
		#plugin::Debug("Column $ColNum");
		for ($RowNum = 0; $RowNum < $Rows; $RowNum++)
		{
			#plugin::Debug("Row $RowNum");
			my $SquadHeading = $Mob->CalculateHeadingToTarget($NewX, $NewY);
			my $CurDist = plugin::DistNoZToCoords($Mob, $NewX, $NewY);
			my $DestH = 0;
			
			if ($LeaderHeading > ($SquadHeading - 64))
			{
				$DestH = $LeaderHeading - $SquadHeading - 64;
			}
			else
			{
				$DestH = 256 + $LeaderHeading - $SquadHeading - 64;
			}
			
			my @DestArray = plugin::CalcDestFromHeading($DestH, $CurDist, $Mob, $MaxZDiff);
			my $DestX = $DestArray[0];
			my $DestY = $DestArray[1];
			my $DestZ = $DestArray[2];

			my $EntityID = quest::spawn2($NPCID, 0, 0, $DestX, $DestY, $DestZ, $LeaderHeading);
			my $CurNPC = $entity_list->GetNPCByID($EntityID);
			my $NewSquadHeading = $Mob->CalculateHeadingToTarget($DestX, $DestY);
			my $HeadingDiff = 0;
			if ($LeaderHeading > $NewSquadHeading)
			{
				$HeadingDiff = $LeaderHeading - $NewSquadHeading;
			}
			else
			{
				$HeadingDiff = $LeaderHeading + 256 - $NewSquadHeading;
			}
			my $LeaderID = $Mob->GetID();
			$CurNPC->SetEntityVariable(50, $CurDist);	# Original Distance from Leader
			$CurNPC->SetEntityVariable(51, $HeadingDiff);	# Original Heading Difference from Leader
			$CurNPC->SetEntityVariable(52, $LeaderID);	# Save the entity ID of the leader NPC
			$NewX = $NewX + $Distance;
		}
		$NewY = $NewY + $Distance;
		$NewX = $SpawnX;
	}

}


#Usage: plugin::SpawnInFormationXY(NPCID, X, Y, Z, Distance, Columns, Rows, Heading, MaxZDiff);
# NPCID is the NPC Type ID of the NPCs you want to form the squad formation with
# X/Y/Z are the coords of the first NPC to spawn that the others are spawned based on it's location
# Distance is the distance each member of the formation will be from each other on both axis
# Columns is the number of columns you want in the formation
# Rows is the number of rows you want in the formation
# Heading is heading for the spawns to face
# MaxZDiff is the maximum height above the leader that the best Z will be searched for

sub SpawnInFormationXY {
	my $NPCID = $_[0];
	my $SpawnX = $_[1];
	my $SpawnY = $_[2];
	my $SpawnZ = $_[3];
	my $Distance = $_[4];
	my $Columns = $_[5];
	my $Rows = $_[6];
	my $Heading = $_[7];
	my $MaxZDiff = $_[8];
	
	if (!$Heading)
	{
		$Heading = 0;
	}
	if (!$MaxZDiff)
	{
		$MaxZDiff = 15;
	}

	my $entity_list = plugin::val('$entity_list');
	
	$SpawnX = $SpawnX + $Distance;
	$SpawnY = $SpawnY - (($Columns - 1) * $Distance / 2);
	# Spawn the first NPC
	quest::spawn2($NPCID, 0, 0, $SpawnX, $SpawnY, $SpawnZ, $Heading);
	#plugin::Debug("Spawned First NPC");
	# Get the first NPC
	my $MainNPC = $entity_list->GetNPCByNPCTypeID($NPCID);
	#plugin::Debug("Got First NPC");
	my $NewX = $SpawnX;
	my $NewY = $SpawnY;
	#my $RowNum = 1;	# Prevent Respawn over the first NPC
	$NewX = $NewX + $Distance;
	
	if ($MainNPC)
	{
		for ($ColNum = 0; $ColNum < $Columns; $ColNum++)
		{
			#plugin::Debug("Column $ColNum");
			for ($RowNum = 0; $RowNum < $Rows; $RowNum++)
			{
				# Prevent Respawn over the first NPC
				if ($RowNum > 0 || $ColNum > 0)
				{
					#plugin::Debug("Row $RowNum");
					my $NewZ = $MainNPC->FindGroundZ($NewX, $NewY, $MaxZDiff);
					quest::spawn2($NPCID, 0, 0, $NewX, $NewY, $NewZ, $Heading);
					$NewX = $NewX + $Distance;
				}
			}
			$NewY = $NewY + $Distance;
			$NewX = $SpawnX;
		}
	}
}


#Usage: plugin::SpawnMixedFormation(LeaderMob, Distance, Columns, Rows, LeadDist=Distance, MaxZDiff=15, NPCID, NPCID...);
# Works just like SpawnInFormation, accept this allows mixing multiple NPCs into the formation
# Can add as many NPCIDs as wanted by appending to the end of the arguments
# NPCID is the NPC Type ID of the NPCs you want to form the squad formation with
# LeaderMob is the Client or NPC you want to spawn the formation behind (use invisible and/or temp NPC to show no leader)
# Distance is the distance each member of the formation will be from each other on both axis
# Columns is the number of columns you want in the formation
# Rows is the number of rows you want in the formation
# LeadDist is the distance you want the formation to be created behind the leader
# MaxZDiff is the maximum height above the leader that the best Z will be searched for

sub SpawnMixedFormation {

	my $Mob = $_[0];
	my $Distance = $_[1];
	my $Columns = $_[2];
	my $Rows = $_[3];
	my $LeadDist = $_[4];
	my $MaxZDiff = $_[5];
	
	if (!$MaxZDiff)
	{
		$MaxZDiff = 15;
	}
	
	if (!$LeadDist)
	{
		$LeadDist = $Distance;
	}
	
	if(!$_[6])
	{
		plugin::Debug("At least 1 NPCID is required for SpawnMixedFormation plugin!");
	}
	my $LastArg = 6;
	while($_[$LastArg])
	{
		$LastArg++;
	}
	
	$LastArg--;
	
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $entity_list = plugin::val('$entity_list');
	
	if (!$Mob) { 
		if ($npc->IsNPC())
		{
			$Mob = $npc;
		}
		elsif ($client->IsClient())
		{
			$Mob = $client;
		}
		else
		{
			return; # No Client or NPC found
		}
	}
	
	my $SpawnX = $Mob->GetX();
	my $SpawnY = $Mob->GetY();
	my $SpawnZ = $Mob->GetZ();

	my $LeaderHeading = $Mob->GetHeading();
	$SpawnX = $SpawnX + $LeadDist;
	$SpawnY = $SpawnY - (($Columns - 1) * $Distance / 2);

	my $NewX = $SpawnX;
	my $NewY = $SpawnY;

	for ($ColNum = 0; $ColNum < $Columns; $ColNum++)
	{
		#plugin::Debug("Column $ColNum");
		for ($RowNum = 0; $RowNum < $Rows; $RowNum++)
		{
			#plugin::Debug("Row $RowNum");
			my $SquadHeading = $Mob->CalculateHeadingToTarget($NewX, $NewY);
			my $CurDist = plugin::DistNoZToCoords($Mob, $NewX, $NewY);
			my $DestH = 0;
			
			if ($LeaderHeading > ($SquadHeading - 64))
			{
				$DestH = $LeaderHeading - $SquadHeading - 64;
			}
			else
			{
				$DestH = 256 + $LeaderHeading - $SquadHeading - 64;
			}
			
			my @DestArray = plugin::CalcDestFromHeading($DestH, $CurDist, $Mob, $MaxZDiff);
			my $DestX = $DestArray[0];
			my $DestY = $DestArray[1];
			my $DestZ = $DestArray[2];

			my $RandomNPCIDArg = plugin::RandomRange(6, $LastArg);
			my $NPCID = $_[$RandomNPCIDArg];
			my $EntityID = quest::spawn2($NPCID, 0, 0, $DestX, $DestY, $DestZ, $LeaderHeading);
			my $CurNPC = $entity_list->GetNPCByID($EntityID);
			my $NewSquadHeading = $Mob->CalculateHeadingToTarget($DestX, $DestY);
			my $HeadingDiff = 0;
			if ($LeaderHeading > $NewSquadHeading) {
				$HeadingDiff = $LeaderHeading - $NewSquadHeading;
			}
			else {
				$HeadingDiff = $LeaderHeading + 256 - $NewSquadHeading;
			}
			my $LeaderID = $Mob->GetID();
			$CurNPC->SetEntityVariable(50, $CurDist);	# Original Distance from Leader
			$CurNPC->SetEntityVariable(51, $HeadingDiff);	# Original Heading Difference from Leader
			$CurNPC->SetEntityVariable(52, $LeaderID);	# Save the entity ID of the leader NPC
			$NewX = $NewX + $Distance;
		}
		$NewY = $NewY + $Distance;
		$NewX = $SpawnX;
	}

}


#Usage: plugin::FollowInFormation(NPCID, Mob, [MaxZDiff]);
# This script will move all of 1 NPC Type ID to the relative Guard position that they were the first time this plugin was run
# NPCID is the NPC ID of the NPCs you want to move in the formation (moves all of this NPC ID in the whole zone)
# Mob is the leader NPC that you want the NPCs to follow in formation
# MaxZDiff is an optional field (default of 30) to set the Max Z the NPCs will check to find the ground Z location

sub FollowInFormation {

	my $entity_list = plugin::val('$entity_list');
	my $SquadNPCID = $_[0];
	my $Mob = $_[1];
	my $MaxZDiff = $_[2];
	my $MoveToX = $Mob->GetX();
	my $MoveToY = $Mob->GetY();
	
	if(!$MaxZDiff) { $MaxZDiff = 15; }

	#my $NewHeading = $Mob->CalculateHeadingToTarget($MoveToX, $MoveToY);
	my $NewHeading = $Mob->GetHeading();
	my $RunSpeed = 0;
	
	my @npclist = $entity_list->GetNPCList();
	foreach $ent (@npclist)
	{
		if($ent->GetNPCTypeID() == $SquadNPCID) {
			
			# Set the Initial Relative Position and Heading variables
			if(!$ent->EntityVariableExists(50)) {	# If this doesn't exist, then neither of them do
				my $SquadX = $ent->GetX();
				my $SquadY = $ent->GetY();
				my $SquadHeading = $Mob->CalculateHeadingToTarget($SquadX, $SquadY);
				my $CurHeading = $Mob->GetHeading();
				my $StartDist = plugin::DistNoZ($Mob, $ent);
				my $HeadingDiff = 0;
				if ($CurHeading > $SquadHeading) {
					$HeadingDiff = $CurHeading - $SquadHeading;
				}
				else {
					$HeadingDiff = $CurHeading + 256 - $SquadHeading;
				}
				$ent->SetEntityVariable(50, $StartDist);	# Original Distance from Leader
				$ent->SetEntityVariable(51, $HeadingDiff);	# Original Heading Difference from Leader
			}
			my $SquadDist = $ent->GetEntityVariable(50);
			my $HDiff = $ent->GetEntityVariable(51);
			#plugin::Debug("Got Variables");
			
			#Set Run Speed depending on distance from the leader
			if(!$RunSpeed)
			{
				my $CurDist = plugin::DistNoZ($Mob, $ent);
				if ($CurDist > ($SquadDist * 10))
				{
					$RunSpeed = 5;
				}
				elsif($CurDist > ($SquadDist * 5))
				{
					$RunSpeed = 3;
				}
				else
				{
					$RunSpeed = 1.25;
				}
			}
			$ent->ModifyNPCStat("runspeed", $RunSpeed);
			
			my $NewSquadHeading = 0;
			if ($NewHeading - $HDiff > 0) {
				$NewSquadHeading = $NewHeading - $HDiff;
			}
			else {
				$NewSquadHeading = 256 + $NewHeading - $HDiff;
			}
			#plugin::Debug("Before Calc");
			#Usage: my @DestArray = plugin::CalcDestFromHeadingXY(Heading, Distance, X, Y, [MaxZDiff, Mob]);
			my @DestArray = plugin::CalcDestFromHeadingXY($NewSquadHeading, $SquadDist, $MoveToX, $MoveToY, $MaxZDiff, $Mob);
			my $NewX = $DestArray[0];
			my $NewY = $DestArray[1];
			my $NewZ = $DestArray[2];
			#plugin::Debug("After Calc");
			$ent->MoveTo($NewX, $NewY, $NewZ, $NewHeading, 1);
			#plugin::Debug("Moving NPC");
		}
	}
}

#Usage: plugin::SquadAttackTarget(SquadNPCID, TargetID);
# Squad1NPCID is the NPC ID of the Squad attacking the other
# TargetID is the Entity ID of the Target being attacked

sub SquadAttackTarget {

	my $entity_list = plugin::val('$entity_list');
	my $SquadNPCID = $_[0];
	my $TargetID = $_[1];
	
	my $TargetNPC = $entity_list->GetNPCByID($TargetID);	# Gets the NPC from the array
	if ($TargetNPC)
	{
		if($TargetNPC->EntityVariableExists(50))	# If this exists, the target is part of a squad
		{
			# Have the squad attack the other squad
			my $TargetNPCID = $TargetNPC->GetNPCTypeID();
			plugin::SquadAttackSquad($SquadNPCID, $TargetNPCID);
		}
		else
		{
			my @npclist = $entity_list->GetNPCList();
			foreach $ent (@npclist)
			{
				# Have the squad attack the single target
				if($ent->GetNPCTypeID() == $SquadNPCID) {
					$ent->AddToHateList($TargetNPC, 1);
				}
			}
		}
	}

}


#Usage: plugin::SquadAttackSquad(Squad1NPCID, Squad2NPCID);
# Squad1NPCID is the NPC ID of the Squad attacking the other squad
# Squad2NPCID is the NPC ID of the Squad being attacked

sub SquadAttackSquad {

	my $entity_list = plugin::val('$entity_list');
	my $SquadNPCID1 = $_[0];
	my $SquadNPCID2 = $_[1];

	my @npclist = $entity_list->GetNPCList();
	my @Squad1 = (); # Creates a cleared array
	my @Squad2 = (); # Creates a cleared array
	foreach $ent (@npclist)
	{
		if($ent->GetNPCTypeID() == $SquadNPCID1) {
			push(@Squad1, $ent->GetID());	# Adds an element to the end of the array
		}
		if($ent->GetNPCTypeID() == $SquadNPCID2) {
			push(@Squad2, $ent->GetID());	# Adds an element to the end of the array
		}
	}
	my $ArraySize1 = @Squad1;
	my $ArraySize2 = @Squad2;
	#plugin::Debug("Squad1: $ArraySize1, Squad2: $ArraySize2");
	
	foreach $EntID (@Squad1)
	{
		if ($EntID)
		{
			my $GotSquadNPC = $entity_list->GetNPCByID($EntID);	# Gets the NPC from the array
			my $RandNPC = plugin::RandomRange(0, $ArraySize2);	# Pick one of the chosen NPCs
			my $GotNPC2 = $entity_list->GetNPCByID($Squad2[$RandNPC]);	# Gets the NPC from the array
			#AddToHateList(other, hate= 0, damage= 0, iYellForHelp= true, bFrenzy= false, iBuffTic= false)
			if ($GotNPC2 && $GotNPC2->IsNPC())
			{
				$GotSquadNPC->AddToHateList($GotNPC2, 1, 0, 0);
			}
			else
			{
				my $GotNPCDefault = $entity_list->GetNPCByID($Squad2[0]);	# Gets the NPC from the array
				$GotSquadNPC->AddToHateList($GotNPCDefault, 1, 0, 0);
			}
		}
	}

}

return 1;	#This line is required at the end of every plugin file in order to use it


#Usage: my @DestArray = plugin::CalcDestFromHeading(Heading, Distance, [Mob, MaxZDiff]);
# This plugin calculates the destination X and Y loc based on heading and distance
# Heading is the heading you want to calculate destination X Y Z from
# Distance is the distance you want for the destination X and Y from the source
# Mob is an optional field to allow any mob to be set, but $npc is default
# MaxZDiff is the max height difference from the source mob's Z you want to calculate the destination from.
#
# The output array can be used as follows:
# my $DestX = $DestArray[0];
# my $DestY = $DestArray[1];
# my $DestZ = $DestArray[2];

sub CalcDestFromHeading {

	my $npc = plugin::val('$npc');
	my $Heading = $_[0];
	my $Distance = $_[1];
	my $Mob = $_[2];
	my $MaxZDiff = $_[3];
	
	if (!$Distance) { return; }
	if (!$Mob) { $Mob = $npc; }
	if (!$MaxZDiff) { $MaxZDiff = 50; }
	
	my $ReverseHeading = 256 - $Heading;
	my $ConvertAngle = $ReverseHeading * 1.40625;
	if ($ConvertAngle <= 270) {
		$ConvertAngle = $ConvertAngle + 90;
	}
	else {
		$ConvertAngle = $ConvertAngle - 270;
	}
	my $Radian = $ConvertAngle * (3.1415927 / 180);

	my $CircleX = $Distance * cos($Radian);
	my $CircleY = $Distance * sin($Radian);
	my $DestX = $CircleX + $Mob->GetX();
	my $DestY = $CircleY + $Mob->GetY();
	my $DestZ = $Mob->FindGroundZ($DestX, $DestY, $MaxZDiff);
	my @DestArray = ($DestX, $DestY, $DestZ);
	return @DestArray;
}


#Usage: my @DestArray = plugin::CalcDestFromHeadingXY(Heading, Distance, X, Y, [MaxZDiff, Mob]);
# This plugin calculates the destination X and Y loc based on heading and distance
# Heading is the heading you want to calculate destination X Y Z from
# Distance is the distance you want for the destination X and Y from the source
# X is the X loc that the destination will be calculated from
# Y is the Y loc that the destination will be calculated from
# MaxZDiff is the max height difference from the source mob's Z you want to calculate the destination from.
#
# The output array can be used as follows:
# my $DestX = $DestArray[0];
# my $DestY = $DestArray[1];
# my $DestZ = $DestArray[2];

sub CalcDestFromHeadingXY {

	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $Heading = $_[0];
	my $Distance = $_[1];
	my $MobX = $_[2];
	my $MobY = $_[3];
	my $MaxZDiff = $_[4];
	my $Mob = $_[5];

	if (!$Mob) { 
		if ($npc->IsNPC())
		{
			$Mob = $npc;
		}
		elsif ($client->IsClient())
		{
			$Mob = $client;
		}
		else
		{
			return; # No Client or NPC found
		}
	}
	if (!$Distance) { return; }
	if (!$MaxZDiff) { $MaxZDiff = 50; }
	
	my $ReverseHeading = 256 - $Heading;
	my $ConvertAngle = $ReverseHeading * 1.40625;
	if ($ConvertAngle <= 270) {
		$ConvertAngle = $ConvertAngle + 90;
	}
	else {
		$ConvertAngle = $ConvertAngle - 270;
	}
	my $PI = 3.141592653589793238;

	my $Radian = $ConvertAngle * ($PI / 180);

	my $CircleX = $Distance * cos($Radian);
	my $CircleY = $Distance * sin($Radian);
	my $DestX = $CircleX + $MobX;
	my $DestY = $CircleY + $MobY;
	my $DestZ = $Mob->FindGroundZ($DestX, $DestY, $MaxZDiff);
	my @DestArray = ($DestX, $DestY, $DestZ);
	return @DestArray;
}


#Usage: plugin::GetReverseHeading($mob);
# Returns the heading of the opposite direction the mob is facing

sub GetReverseHeading {
	my $Mob = $_[0];
	
	my $CurHeading = $Mob->GetHeading();
	my $ReverseHeading = 128 + $CurHeading;
	if ($ReverseHeading >= 256) {
		$ReverseHeading = $ReverseHeading - 256;
	}
	return $ReverseHeading;
}


#Usage: my $Degrees = plugin::ConvertHeadingToDegrees(Heading);
# Converts 0-256 headings into 0 to 360 degrees

sub ConvertHeadingToDegrees {

	my $Heading = $_[0];
	
	my $ReverseHeading = 256 - $Heading;
	my $ConvertAngle = $ReverseHeading * 1.40625;
	if ($ConvertAngle <= 270) {
		$ConvertAngle = $ConvertAngle + 90;
	}
	else {
		$ConvertAngle = $ConvertAngle - 270;
	}

	return $ConvertAngle;
}

#Usage: plugin::Debug("Message", Color, Mob);
# "Message" is a required field and is the message you want to show up in the debug
# Color is an optional field and if not set will default to a pink/purple color
# Mob is an optional field if you want to export a particular mob to debug from (used for getting the name)
# Example 1: plugin::Debug("Event Started", 7);
# Example 2: plugin::Debug("Event Started");

sub Debug {

	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $MyMessage = $_[0];
	my $TextColor = $_[1];
	if (!$TextColor)
	{
		$TextColor = 326;	#Set the Text Color for the Message (this one is bright purple)
	}
	my $Mob = $_[2];
	
	if (!$Mob)
	{
		if ($npc)
		{
			# NPC Quest
			$Mob = $npc;
		}
		elsif ($client)
		{
			# Player Quest
			$Mob = $client;
		}
	}
	my $MobName = "NO_NAME";
	if ($Mob) {
		#Get the clean name of the Mob sending the message
		$MobName = $Mob->GetCleanName();	
	}
	
	#Send a message in purple (default) to GMs in the Zone only
	quest::gmsay("$MobName Debugs: $MyMessage", $TextColor);	
}


return 1;	#This line is required at the end of every plugin file in order to use it