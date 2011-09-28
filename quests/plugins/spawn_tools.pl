#Usage: my $LoSDistance = plugin::GetMaxLoSDistFromHeading(Heading, [DistIncrements, MaxDist, Mob]);
# This plugin attempts to get the max visible distance from the specified heading for the specified mob
# It returns the Max LoS that it can find for the settings provided
# Heading is the direction to get the max LoS for.
# DistIncrements is how much the distance check will increase each loop it does (default 20).
# Higher distance is more efficient but less precise.
# MaxDist is the maximum distance to check up to for LoS (default 200).
# Mob is an optional field to set the source NPC/Client (default is current NPC)
sub GetMaxLoSDistFromHeading {

	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $Heading = $_[0];
	my $DistIncrements = $_[1];
	my $MaxDist = $_[2];
	my $Mob = $_[3];
	if (!$DistIncrements)
	{ 
		$DistIncrements = 20;
	}
	if (!$MaxDist)
	{ 
		$MaxDist = 200;
	}
	if (!$Mob)
	{ 
		$Mob = $npc;
	}
	my $LoSMobSize = 5;
	my $MaxZDiff = 10;
	my $MaxLoS = 0;
	my $OrigX = $Mob->GetX();
	my $OrigY = $Mob->GetY();
	for ($LoSDistCheck = $DistIncrements; $LoSDistCheck <= $MaxDist; $LoSDistCheck += $DistIncrements)
	{
		my $Degrees = plugin::ConvertHeadingToDegrees($Heading);
		#plugin::Debug("Current Distance Check: $LoSDistCheck || Degrees $Degrees");

		my $PI = 3.141592653589793238;
		my $Radian = $Degrees * ($PI / 180);

		my $CircleX = $LoSDistCheck * cos($Radian);
		my $CircleY = $LoSDistCheck * sin($Radian);
		my $DestX = $CircleX + $OrigX;
		my $DestY = $CircleY + $OrigY;
		my $DestZ = $Mob->FindGroundZ($DestX, $DestY, $MaxZDiff);
		my $LoS_Check = $Mob->CheckLoSToLoc($DestX, $DestY, $DestZ, $LoSMobSize);
		if ($LoS_Check)
		{
			#plugin::Debug("LoS Success");
			# If LoS is successful at this distance, continue the loop to check the next distance
			$MaxLoS = $LoSDistCheck;
		}
		else
		{
			# Once LoS fails, end the loop
			$LoSDistCheck = $MaxDist + 1;
		}
	}
	
	return $MaxLoS;

}


#Usage: plugin::FaceBestHeading([MinLoSDist]);
# This plugin attempts to find a good heading that isn't facing a wall/structure that blocks LoS
# If the NPC is currently facing a wall, this will look for the clearest/longest view available and point that way
# It returns the best heading that it finds as well
# MinLoSDist is the minimum distance to start searching for better headings (default 20)
# If the NPC is already facing a heading that has further LoS than MinLoSDist, it will not change heading
sub FaceBestHeading {

	my $npc = plugin::val('$npc');
	my $MinLoSDist = $_[0];

	if (!$MinLoSDist)
	{ 
		$MinLoSDist = 20;
	}

	# Build an array for the best matching headings
	my @BestHeadings = ();
	
	my $CurHeading = $npc->GetHeading();
	my $LoSDistance = plugin::GetMaxLoSDistFromHeading($CurHeading);
	my $MaxLoSDistance = $LoSDistance;
	my $EqualHeadings = 0;

	if ($LoSDistance < $MinLoSDist)
	{
		# Check headings in 16 directions for the best one(s)
		for ($HeadingCheck = 0; $HeadingCheck < 256; $HeadingCheck += 16)
		{
			$LoSDistance = plugin::GetMaxLoSDistFromHeading($HeadingCheck, 5, 35);
			if ($LoSDistance >= $MaxLoSDistance)
			{
				if ($LoSDistance == $MaxLoSDistance && $EqualHeadings > 0)
				{
					# If this headings max LoS is equal to the previous one, add it to the array of best headings
					push(@BestHeadings, $HeadingCheck);
					# For equal headings to be added to the array, they must all be consecutive
					$EqualHeadings++;
				}
				else
				{
					@BestHeadings = ($HeadingCheck);
					#plugin::Debug("Array Set to $HeadingCheck");
					$MaxLoSDistance = $LoSDistance;
					# Reset the equal headings count to 1 when a new max is found
					$EqualHeadings = 1;
				}
			}
			else
			{
				# Set equal headings to 0 if the current heading is less than the current Max LoS
				# This ensures that equal headings will always be consecutive
				$EqualHeadings = 0;
			}
		}
		my $NewHeading = $CurHeading;
		my $BestCount = @BestHeadings;

		# If the Heading Array has entries, use the one in the middle of the array
		if ($BestCount)
		{
			# Choose the best heading in the middle of the array to face the most open/clear angle
			my $ArrayPick = int($BestCount / 2);
			$NewHeading = $BestHeadings[$ArrayPick];
		}

		$npc->SetHeading($NewHeading);
		$npc->SendPosition();
	}
	return $NewHeading;

}


#Usage: my $ShortestHeading = plugin::HeadingToShortestLoS([MaxDistToCheck=8]);
# MaxDistToCheck is the maximum distance to check for nearby LoS blocking
sub HeadingToShortestLoS {

	my $npc = plugin::val('$npc');
	my $MaxDistToCheck = $_[0];

	if (!$MaxDistToCheck)
	{ 
		$MaxDistToCheck = 8;
	}

	my $OrigX = $npc->GetX();
	my $OrigY = $npc->GetY();
	my $OrigZ = $npc->GetZ();
	my $ZeroLoSCheck = $npc->CheckLoSToLoc(($OrigX + 0.1), $OrigY, $OrigZ, 5);
	if (!$ZeroLoSCheck)
	{
		# If this check fails, they are probably stuck in a wall
		return -2;
	}

	my @BestHeadings = ();
	
	my $CurHeading = $npc->GetHeading();
	my $MinLoSDistance = 5000;

	for ($HeadingCheck = 0; $HeadingCheck < 256; $HeadingCheck += 16)
	{
		$LoSDistance = plugin::GetMaxLoSDistFromHeading($HeadingCheck, 1, $MaxDistToCheck);
		if ($LoSDistance <= $MinLoSDistance)
		{
			if ($LoSDistance == $MinLoSDistance)
			{
				push(@BestHeadings, $HeadingCheck);
			}
			else
			{
				@BestHeadings = ($HeadingCheck);
				$MinLoSDistance = $LoSDistance;
			}
		}
	}
	my $NewHeading = $CurHeading;
	my $BestCount = @BestHeadings;

	# If the Heading Array has entries, use the one in the middle of the array
	if ($BestCount && $BestCount < 15)
	{
		my $ArrayPick = int($BestCount / 2);
		$NewHeading = $BestHeadings[$ArrayPick];
	}
	else
	{
		# Return -1 if no nearby objects found blocking LoS
		return -1;
	}

	return $NewHeading;

}


#Usage: my $NPCMoved = plugin::MoveAwayFromWall([MinLoSDist=5]);
# MinLoSDist is the minimum distance to start searching for better headings (default 40)
# If the NPC is already facing a heading that has further LoS than MinLoSDist, it will not change heading
sub MoveAwayFromWall {

	my $npc = plugin::val('$npc');

	my $ShortestHeading = plugin::HeadingToShortestLoS();
	if ($ShortestHeading == -2)
	{
		# Stuck in a wall
		#$npc->Depop();
		return -1;
	}
	elsif ($ShortestHeading == -1)
	{
		# Not too close to a wall
		#plugin::FaceBestHeading(25);
		return 0;
	}
	else
	{
		# Close to a wall
		my @DestArray = plugin::CalcDestFromHeading($ShortestHeading, 5);
		my $DestX = $DestArray[0];
		my $DestY = $DestArray[1];
		my $DestZ = $DestArray[2];
		my $LoS_Check = $npc->CheckLoSToLoc($DestX, $DestY, $DestZ, 5);
		
		# If this check fails, they are too close to the wall
		if (!$LoS_Check)
		{
			# Face them toward the wall
			$npc->SetHeading($ShortestHeading);
			# Get the reverse heading from the wall
			my $ReverseHeading = plugin::GetReverseHeading();
			#my $LoSDistance = plugin::GetMaxLoSDistFromHeading($ReverseHeading, 1, 5);
			@DestArray = plugin::CalcDestFromHeading($ReverseHeading, 10);
			$DestX = $DestArray[0];
			$DestY = $DestArray[1];
			$DestZ = $DestArray[2];
			$LoS_Check = $npc->CheckLoSToLoc($DestX, $DestY, $DestZ, 5);
			# If there is enough room, move them the opposite direction from the nearest wall
			if ($LoS_Check)
			{
				@DestArray = plugin::CalcDestFromHeading($ReverseHeading, 10);
				$DestX = $DestArray[0];
				$DestY = $DestArray[1];
				$DestZ = $DestArray[2];
				$npc->GMMove($DestX, $DestY, ($DestZ + 1), $ReverseHeading);
				# Return true if moved
				return 1;
			}
			else
			{
				# Not enough room to move toward or away from the wall
				# Move toward the best heading
				my $BestHeading = plugin::FaceBestHeading();
				@DestArray = plugin::CalcDestFromHeading($BestHeading, 6);
				$DestX = $DestArray[0];
				$DestY = $DestArray[1];
				$DestZ = $DestArray[2];
				$npc->GMMove($DestX, $DestY, ($DestZ + 1), $BestHeading);
				# Return true if moved
				return 1;
			}
		}
	}
	
	# If no move, return false
	return 0;
}


#Usage: plugin::MoveToFirstBestZ();
sub MoveToFirstBestZ {

	my $npc = plugin::val('$npc');
	my $x = plugin::val('$x');
	my $y = plugin::val('$y');
	my $h = plugin::val('$h');
	$npc->GMMove($x, $y, 1000, $h);
	my $GroundZ = $npc->FindGroundZ($x, $y, 3);
	if($GroundZ > -5000)
	{
		$npc->GMMove($x, $y, ($GroundZ -10), $h);
		$NextGroundZ = $npc->FindGroundZ($x, $y, 3);
		if($NextGroundZ > -5000)
		{
			$npc->GMMove($x, $y, $NextGroundZ, $h);
		}
		else
		{
			$npc->GMMove($x, $y, $GroundZ, $h);
		}
	}

}


#Usage: plugin::SpawnZone(X, Y, Z, Distance, Variance, Columns, Rows);
# This is used to spawn a grid of NPCs and can be used to spawn an entire zone
# X/Y/Z are the coords of the first NPC to spawn that the others are spawned based on it's location
# Distance is the distance each member of the formation will be from each other on both axis
# Variance is the max distance of scatter effect you want on the grid positioning to make it look less like a grid
# Columns is the number of columns you want in the formation
# Rows is the number of rows you want in the formation

sub SpawnZone {

	my $entity_list = plugin::val('$entity_list');
	my $SpawnX = $_[0];
	my $SpawnY = $_[1];
	my $SpawnZ = $_[2];
	my $Distance = $_[3];
	my $Variance = $_[4];
	my $Columns = $_[5];
	my $Rows = $_[6];
	
	$Heading = plugin::RandomRange(0, 254);
	$MaxZDiff = 3;

	# Create the array of NPCIDs to spawn in the grid
	my @NPCIDList = ();
	my $NPCNum = 7;
	while ($_[$NPCNum])
	{
		push(@NPCIDList, $_[$NPCNum]);
		$NPCNum++;
	}

	my $ListLength = (@NPCIDList) - 1;
	my $FirstNPCID = $NPCIDList[0];

	# Set the first NPC to spawn directly in the center of the grid
	$SpawnX = $SpawnX - (($Rows - 1) * $Distance / 2);
	$SpawnY = $SpawnY - (($Columns - 1) * $Distance / 2);
	# Spawn the first NPC
	quest::spawn2($FirstNPCID, 0, 0, $SpawnX, $SpawnY, $SpawnZ, $Heading);

	# Get the first NPC
	my $MainNPC = $entity_list->GetNPCByNPCTypeID($FirstNPCID);

	my $NewX = $SpawnX;
	my $NewY = $SpawnY;
	$NewX = $NewX + $Distance;
	
	if ($MainNPC)
	{
		for ($ColNum = 0; $ColNum < $Columns; $ColNum++)
		{
			for ($RowNum = 0; $RowNum < $Rows; $RowNum++)
			{
				# Prevent Respawn over the first NPC
				if ($RowNum > 0 || $ColNum > 0)
				{
					my $RandXDiff = plugin::RandomRange(0, $Variance);
					my $RandYDiff = plugin::RandomRange(0, $Variance);
					# Set even numbers to negative
					if ($RandXDiff && ($RandXDiff / 2) == int($RandXDiff / 2))
					{
						$RandXDiff *= -1;
					}
					if ($RandYDiff && ($RandYDiff / 2) == int($RandYDiff / 2))
					{
						$RandYDiff *= -1;
					}
					my $ModX = $NewX + $RandXDiff;
					my $ModY = $NewY + $RandYDiff;
					my $NewZ = $MainNPC->FindGroundZ($ModX, $ModY, $MaxZDiff);

					if ($NewZ > -5000)
					{
						my $RandomNPCNum = plugin::RandomRange(0, $ListLength);
						my $NPCID = $NPCIDList[$RandomNPCNum];
						my $RandHeading = plugin::RandomRange(0, 254);
						quest::spawn2($NPCID, 0, 0, $ModX, $ModY, $NewZ, $RandHeading);
					}
					$NewX = $NewX + $Distance;
				}
			}
			$NewY = $NewY + $Distance;
			$NewX = $SpawnX;
		}
	}
}


#Usage: my $ReverseHeading = plugin::GetReverseHeading([$mob]);
# Returns the heading of the opposite direction the mob is facing

sub GetReverseHeading {

	my $npc = plugin::val('$npc');
	my $Mob = $_[0];
	if (!$Mob)
	{ 
		$Mob = $npc;
	}
	my $CurHeading = $Mob->GetHeading();
	my $ReverseHeading = 128 + $CurHeading;
	if ($ReverseHeading >= 256)
	{
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
	if ($ConvertAngle <= 270)
	{
		$ConvertAngle = $ConvertAngle + 90;
	}
	else
	{
		$ConvertAngle = $ConvertAngle - 270;
	}

	return $ConvertAngle;
}


return 1;	#This line is required at the end of every plugin file in order to use it