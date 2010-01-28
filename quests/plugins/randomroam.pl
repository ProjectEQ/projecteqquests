#Usage: plugin::RandomRoam($npc, MaxXVariance, MaxYVariance);

sub RandomRoam {

	my $npc = $_[0];
	my $MaxXVariance = $_[1];
	my $MaxYVariance = $_[2];
	
	# Don't try to roam if engaged in combat!
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
			if ($NewZ > -999999 && $OrigZ > ($NewZ - 16) && $OrigZ < ($NewZ + 14)) {
				my $LoS_Check = $npc->CheckLoSToLoc($NewX, $NewY, $NewZ, 5);
				#Check LoS to the new random Loc
				if ($LoS_Check) {
					quest::moveto($NewX, $NewY, $NewZ, -1, 1);
				}
			}
		}
	}
}

return 1;	#This line is required at the end of every plugin file in order to use it