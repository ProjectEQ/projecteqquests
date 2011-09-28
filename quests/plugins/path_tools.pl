#NOTE: These functions require the globals.pl file for use of the val() plugin

#Usage: plugin::RandomRoam(MaxXVariance, MaxYVariance, MaxZVariance, LoSMobSize);
# MaxXVariance - Sets the max X variance to travel 
# MaxYVariance - Sets the max Y variance to travel 
# MaxZVariance - Sets the max Z variance to travel.  This field is optional and default is 15.
# LoSMobSize - Sets the size of the mob LoS check.  This field is optional and default is 5.
# The LoS check basically looks from your NPC to an imaginary NPC of the LoSMobSize size to see if LoS exists

sub RandomRoam {

	my $npc = plugin::val('$npc');
	my $MaxXVariance = $_[0];
	my $MaxYVariance = $_[1];
	my $MaxZVariance = $_[2];
	my $LoSMobSize = $_[3];

	#Set the Max Z Variance to 15 if no 3rd argument is set
	if(!$MaxZVariance){
		$MaxZVariance = 15;
	}
	
	#Set the LoS Check Mob Size to 5 if no 4th argument is set
	if(!$LoSMobSize){
		$LoSMobSize = 5;
	}
	
	# Don't try to roam if already engaged in combat!
	if ($npc->IsEngaged() != 1) {

		#Get needed Locs
		my $CurX = $npc->GetX();
		my $CurY = $npc->GetY();
		#my $CurZ = $npc->GetZ();	#Not currently required by this plugin
		my $OrigX = $npc->GetSpawnPointX();
		my $OrigY = $npc->GetSpawnPointY();
		my $OrigZ = $npc->GetSpawnPointZ();
		my $GuardX = $npc->GetGuardPointX();
		my $GuardY = $npc->GetGuardPointY();

		if ($CurX == $GuardX && $CurY == $GuardY) {	#If the NPC has finished walking to the previous given Loc

			#Get a random X and Y within the set range
			my $RandomX = int(rand($MaxXVariance - 1)) + 1;
			my $RandomY = int(rand($MaxYVariance - 1)) + 1;
			my $PosX = $OrigX + $RandomX;
			my $PosY = $OrigY + $RandomY;
			my $NegX = $OrigX - $RandomX;
			my $NegY = $OrigY - $RandomY;
			my $NewX = quest::ChooseRandom($PosX, $NegX);
			my $NewY = quest::ChooseRandom($PosY, $NegY);
			
			#Check for LoS and Z issues before moving to the new Loc
			my $NewZ = $npc->FindGroundZ($NewX,$NewY, 5) + 1;	#Add 1 to the new Z to prevent hopping issue when they arrive
			if ($NewZ > -999999 && $OrigZ > ($NewZ - $MaxZVariance + 1) && $OrigZ < ($NewZ + $MaxZVariance - 1)) {
				my $LoS_Check = $npc->CheckLoSToLoc($NewX, $NewY, $NewZ, $LoSMobSize);
				#Check LoS to the new random Loc
				if ($LoS_Check) {
					quest::moveto($NewX, $NewY, $NewZ, -1, 1);
				}
			}
		}
	}
}

#Usage: plugin::StraightPath(MaxXVariance, MaxYVariance);

sub StraightPath {
	
	my $npc = plugin::val('$npc');
	my $MaxXVariance = $_[0];
	my $MaxYVariance = $_[1];
	
	# Don't try to roam if already engaged in combat!
	if ($npc->IsEngaged() != 1) {	

		#Get needed Locs
		my $CurX = $npc->GetX();
		my $CurY = $npc->GetY();
		#my $CurZ = $npc->GetZ();	#Not currently required by this plugin
		my $OrigX = $npc->GetSpawnPointX();
		my $OrigY = $npc->GetSpawnPointY();
		my $OrigZ = $npc->GetSpawnPointZ();
		my $GuardX = $npc->GetGuardPointX();
		my $GuardY = $npc->GetGuardPointY();

		if ($CurX == $GuardX && $CurY == $GuardY) {	#If the NPC has finished walking to the previous given Loc

			#Get a random X and Y within the set range
			my $RandomX = int(rand($MaxXVariance - 1)) + 1;
			my $RandomY = int(rand($MaxYVariance - 1)) + 1;
			my $PosX = $OrigX + $RandomX;
			my $PosY = $OrigY + $RandomY;
			my $NegX = $OrigX - $RandomX;
			my $NegY = $OrigY - $RandomY;
			my $NewX = quest::ChooseRandom($PosX, $NegX, $OrigX, $OrigX);
			
			if ($NewX == $OrigX) {	# If we are using the orignal X, then chose a random Y to go to
				if ($CurX == $OrigX) {	# If they are moving on the same Axis they are currently on
					my $NewY = quest::ChooseRandom($PosY, $NegY);
					#Check for LoS and Z issues before moving to the new Loc
					my $NewZ = $npc->FindGroundZ($NewX, $NewY, 5) + 1;	#Add 1 to the new Z to prevent hopping issue when they arrive
					if ($NewZ > -999999 && $OrigZ > ($NewZ - 16) && $OrigZ < ($NewZ + 14)) {
						if ($NewY > $OrigY) {	# Checking which direction we are moving in
							# Adjust the LoS Check to check further than how far we are traveling so we stay away from walls
							my $LoS_Check = $npc->CheckLoSToLoc($NewX, $NewY + 2, $NewZ, 5);
							#Check LoS to the new random Loc
							if ($LoS_Check) {
								quest::moveto($NewX, $NewY, $NewZ, -1, 1);
							}
						}
						else {
							# Adjust the LoS Check to check further than how far we are traveling so we stay away from walls
							my $LoS_Check = $npc->CheckLoSToLoc($NewX, $NewY - 2, $NewZ, 5);
							#Check LoS to the new random Loc
							if ($LoS_Check) {
								quest::moveto($NewX, $NewY, $NewZ, -1, 1);
							}
						}
					}
				}
				else {	# If not moving on the same Axis they are already on, just return them to their Spawn Point
					quest::moveto($OrigX, $OrigY, $OrigZ, -1, 1);
				}
			}
			else {	# If we are not using the orignal X, then use the original Y instead
				if ($CurY == $OrigY) {	# If they are moving on the same Axis they are currently on
					#Check for LoS and Z issues before moving to the new Loc
					my $NewZ = $npc->FindGroundZ($NewX, $OrigY, 5) + 1;	#Add 1 to the new Z to prevent hopping issue when they arrive
					if ($NewZ > -999999 && $OrigZ > ($NewZ - 16) && $OrigZ < ($NewZ + 14)) {
						if ($NewX > $OrigX) {	# Checking which direction we are moving in
							# Adjust the LoS Check to check further than how far we are traveling so we stay away from walls
							my $LoS_Check = $npc->CheckLoSToLoc($NewX + 2, $OrigY, $NewZ, 5);
							#Check LoS to the new random Loc
							if ($LoS_Check) {
								quest::moveto($NewX, $OrigY, $NewZ, -1, 1);
							}
						}
						else {
							# Adjust the LoS Check to check further than how far we are traveling so we stay away from walls						
							my $LoS_Check = $npc->CheckLoSToLoc($NewX - 2, $OrigY, $NewZ, 5);
							#Check LoS to the new random Loc
							if ($LoS_Check) {

								quest::moveto($NewX, $OrigY, $NewZ, -1, 1);
							}
						}
					}
				}
				else {	# If not moving on the same Axis they are already on, just return them to their Spawn Point
					quest::moveto($OrigX, $OrigY, $OrigZ, -1, 1);
				}
			}
		}
	}
}


#Usage: plugin::RandomSwim(MaxXVariance, MaxYVariance, WaterSurfaceZ);

sub RandomSwim {

	my $npc = plugin::val('$npc');
	my $MaxXVariance = $_[0];
	my $MaxYVariance = $_[1];
	my $WaterSurfaceZ = $_[2];
	
	# Don't try to roam if already engaged in combat!
	if ($npc->IsEngaged() != 1) {

		#Get needed Locs
		my $CurX = $npc->GetX();
		my $CurY = $npc->GetY();
		#my $CurZ = $npc->GetZ();	#Not currently required by this plugin
		my $OrigX = $npc->GetSpawnPointX();
		my $OrigY = $npc->GetSpawnPointY();
		my $OrigZ = $npc->GetSpawnPointZ();
		my $GuardX = $npc->GetGuardPointX();
		my $GuardY = $npc->GetGuardPointY();

		if ($CurX == $GuardX && $CurY == $GuardY) {	#If the NPC has finished walking to the previous given Loc

			#Get a random X and Y within the set range
			my $RandomX = int(rand($MaxXVariance - 1)) + 1;
			my $RandomY = int(rand($MaxYVariance - 1)) + 1;
			my $PosX = $OrigX + $RandomX;
			my $PosY = $OrigY + $RandomY;
			my $NegX = $OrigX - $RandomX;
			my $NegY = $OrigY - $RandomY;
			my $NewX = quest::ChooseRandom($PosX, $NegX);
			my $NewY = quest::ChooseRandom($PosY, $NegY);
			
			#Check for LoS and Z issues before moving to the new Loc
			my $NewZ = $npc->FindGroundZ($NewX,$NewY, 5) + 1;	#Add 1 to the new Z to prevent hopping issue when they arrive
			if ($NewZ > -999999 && $NewZ < $WaterSurfaceZ) {
				my $SwimZ = plugin::RandomRange($NewZ, $WaterSurfaceZ);
				my $LoS_Check = $npc->CheckLoSToLoc($NewX, $NewY, $SwimZ, 5);
				#Check LoS to the new random Loc
				if ($LoS_Check) {
					#if($npc->GetFlyMode() != 1) {
					#	$npc->SetFlyMode(1);
					#}
					quest::moveto($NewX, $NewY, $SwimZ, -1, 1);
				}
			}
		}
	}
}

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

return 1;	#This line is required at the end of every plugin file in order to use it