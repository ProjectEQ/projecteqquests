#Usage: plugin::StraightPath(MaxXVariance, MaxYVariance);

sub StraightPath {
	
	my $npc = $_[0];
	my $MaxXVariance = $_[1];
	my $MaxYVariance = $_[2];
	
	# Don't try to roam if already engaged in combat!
	if ($npc->IsEngaged() != 1) {
		#my $AtGuardSpot = 0;	

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
			#$AtGuardSpot = 1;

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

		#Bool Return option to see the result of if the NPC is at it's new loc or not
		#return $AtGuardSpot;
	}
}

return 1;	#This line is required at the end of every plugin file in order to use it