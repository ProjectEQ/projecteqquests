#Usage: plugin::RandomFeatures(Mob);
# Chooses a random set of facial features for playable races (NPCs or Players)

sub RandomFeatures {

	my $Mob = $_[0];

	if ($Mob)
	{
		$MobRace = $Mob->GetRace();
		
		if ($MobRace <= 12 || $MobRace == 128 || $MobRace == 130 || $MobRace == 330 || $MobRace == 522)
		{
			
			$Gender = $Mob->GetGender();
			$Texture = 0xFF;
			$HelmTexture = 0xFF;
			$HairColor = 0xFF;
			$BeardColor = 0xFF;
			$EyeColor1 = 0xFF;
			$EyeColor2 = 0xFF;
			$HairStyle = 0xFF;
			$LuclinFace = 0xFF;
			$Beard = 0xFF;
			$DrakkinHeritage = 0xFFFFFFFF;
			$DrakkinTattoo = 0xFFFFFFFF;
			$DrakkinDetails = 0xFFFFFFFF;
			
			# Set some common feature settings
			$EyeColor1 = plugin::RandomRange(0, 9);
			$EyeColor2 = plugin::RandomRange(0, 9);
			$LuclinFace = plugin::RandomRange(0, 7);
			
			# Adjust all settings based on the min and max for each feature of each $MobRace and $Gender
			#plugin::Debug("About to switch case");
			use Switch;

			switch ($MobRace)
			{
				case (1)
				{
					# Human
					$HairColor = plugin::RandomRange(0, 19);
					if ($Gender == 0) {
						$BeardColor = $HairColor;
						$HairStyle = plugin::RandomRange(0, 3);
						$Beard = plugin::RandomRange(0, 5);
					}
					if ($Gender == 1) {
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (2)
				{
					# Barbarian
					$HairColor = plugin::RandomRange(0, 19);
					$LuclinFace = plugin::RandomRange(0, 87);
					if ($Gender == 0) { #
						$BeardColor = $HairColor;
						$HairStyle = plugin::RandomRange(0, 3);
						$Beard = plugin::RandomRange(0, 5);
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (3) 
				{
					# Erudite
					if ($Gender == 0) { #
						$BeardColor = plugin::RandomRange(0, 19);
						$Beard = plugin::RandomRange(0, 5);
						$LuclinFace = plugin::RandomRange(0, 57);
					}
					if ($Gender == 1) { #
						$LuclinFace = plugin::RandomRange(0, 87);
					}
				}
				case (4) 
				{
					# WoodElf
					$HairColor = plugin::RandomRange(0, 19);
					if ($Gender == 0) { #
						$HairStyle = plugin::RandomRange(0, 3);
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (5) 
				{
					# HighElf
					$HairColor = plugin::RandomRange(0, 14);
					if ($Gender == 0) { #
						$HairStyle = plugin::RandomRange(0, 3);
						$LuclinFace = plugin::RandomRange(0, 37);
						$BeardColor = $HairColor;
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (6) 
				{
					# DarkElf
					$HairColor = plugin::RandomRange(13, 18);
					if ($Gender == 0) { #
						$HairStyle = plugin::RandomRange(0, 3);
						$LuclinFace = plugin::RandomRange(0, 37);
						$BeardColor = $HairColor;
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (7) 
				{
					# HalfElf
					$HairColor = plugin::RandomRange(0, 19);
					if ($Gender == 0) { #
						$HairStyle = plugin::RandomRange(0, 3);
						$LuclinFace = plugin::RandomRange(0, 37);
						$BeardColor = $HairColor;
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (8) 
				{
					# Dwarf
					$HairColor = plugin::RandomRange(0, 19);
					$BeardColor = $HairColor;
					if ($Gender == 0) { #
						$HairStyle = plugin::RandomRange(0, 3);
						$Beard = plugin::RandomRange(0, 5);
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
						$LuclinFace = plugin::RandomRange(0, 17);
					}
				}
				case (9) 
				{
					# Troll
					$EyeColor1 = plugin::RandomRange(0, 10);
					$EyeColor2 = plugin::RandomRange(0, 10);
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 3);
						$HairColor = plugin::RandomRange(0, 23);
					}
				}
				case (10) 
				{
					# Ogre
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 3);
						$HairColor = plugin::RandomRange(0, 23);
					}
				}
				case (11) 
				{
					# Halfling
					$HairColor = plugin::RandomRange(0, 19);
					if ($Gender == 0) { #
						$BeardColor = $HairColor;
						$HairStyle = plugin::RandomRange(0, 3);
						$Beard = plugin::RandomRange(0, 5);
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (12) 
				{
					# Gnome
					$HairColor = plugin::RandomRange(0, 24);
					if ($Gender == 0) { #
						$BeardColor = $HairColor;
						$HairStyle = plugin::RandomRange(0, 3);
						$Beard = plugin::RandomRange(0, 5);
					}
					if ($Gender == 1) { #
						$HairStyle = plugin::RandomRange(0, 2);
					}
				}
				case (128) 
				{
					# Iksar
					$LuclinFace = plugin::RandomRange(0, 9);
				}
				case (130) 
				{
					# VahShir
					$LuclinFace = plugin::RandomRange(0, 9);
				}
				case (330) 
				{
					# Froglok
					$LuclinFace = plugin::RandomRange(0, 9);
				}
				case (522) 
				{
					# Drakkin
					$HairColor = plugin::RandomRange(0, 3);
					$BeardColor = $HairColor;
					$EyeColor1 = plugin::RandomRange(0, 11);
					$EyeColor2 = plugin::RandomRange(0, 11);
					$LuclinFace = plugin::RandomRange(0, 6);
					$DrakkinHeritage = plugin::RandomRange(0, 6);
					$DrakkinTattoo = plugin::RandomRange(0, 7);
					$DrakkinDetails = plugin::RandomRange(0, 7);
					if ($Gender == 0) { #
						$Beard = plugin::RandomRange(0, 12);
						$HairStyle = plugin::RandomRange(0, 8);
					}
					if ($Gender == 1) { #
						$Beard = plugin::RandomRange(0, 3);
						$HairStyle = plugin::RandomRange(0, 7);
					}
				}

			}
			#plugin::Debug("About to SendIllusion");
			$Mob->SendIllusion($MobRace,$Gender,$Texture,$HelmTexture,$LuclinFace,$HairStyle,$HairColor,$Beard,$BeardColor,$DrakkinHeritage,$DrakkinTattoo,$DrakkinDetails); # ,$size
		}
	}

}


#Usage: plugin::CloneAppearance(MobA, MobB, CloneName=false);
# Clones the looks of a mob
# MobA is the target mob to clone from
# MonB is the mob that is changing to clone MobA
# CloneName is an optional field that if set to 1 will clone the name of the target as well

sub CloneAppearance {
	my $MobA = $_[0];
	my $MobB = $_[1];
	my $CloneName = $_[2];
	
	my $Race = $MobA->GetRace();
	my $Gender = $MobA->GetGender();
	my $Texture = $MobA->GetTexture();
	my $HelmTexture = $MobA->GetHelmTexture();
	my $Face = $MobA->GetLuclinFace();
	my $HairStyle = $MobA->GetHairStyle();
	my $HairColor = $MobA->GetHairColor();
	my $Beard = $MobA->GetBeard();
	my $BeardColor = $MobA->GetBeardColor();
	my $DrakkinHeritage = $MobA->GetDrakkinHeritage();
	my $DrakkinTattoo = $MobA->GetDrakkinTattoo();
	my $DrakkinDetails = $MobA->GetDrakkinDetails();
	my $Size = $MobA->GetSize();
	
	if (!$Size)
	{
		%RaceSizes = (
			1 => 6, # Human
			2 => 8, # Barbarian
			3 => 6, # Erudite
			4 => 5, # Wood Elf
			5 => 5, # High Elf
			6 => 5, # Dark Elf
			7 => 5, # Half Elf
			8 => 4, # Dwarf
			9 => 9, # Troll
			10 => 9, # Ogre
			11 => 3, # Halfling
			12 => 3, # Gnome
			128 => 6, # Iksar
			130 => 6, # Vah Shir
			330 => 5, # Froglok
			522 => 6, # Drakkin
		);
		
		$Size = $RaceSizes{$Race};
	}
	
	if (!$Size)
	{
		$Size = 6;
	}

	if ($Size > 15)
	{
		$Size = 15;
	}
	
	$MobB->SendIllusion($Race, $Gender, $Texture, $HelmTexture, $Face, $HairStyle, $HairColor, $Beard, $BeardColor, $DrakkinHeritage, $DrakkinTattoo, $DrakkinDetails, $Size);
	
	for ($slot = 0; $slot < 7; $slot++)
	{
		my $Color = 0;
		my $Material = 0;
		if ($MobA->IsClient() || $slot > 6)
		{
			$Color = $MobA->GetEquipmentColor($slot);
			$Material = $MobA->GetEquipmentMaterial($slot);
		}
		else
		{
			$Color = $MobA->GetArmorTint($slot);
			if ($slot == 0)
			{
				$Material = $MobA->GetHelmTexture();
			}
			else
			{
				$Material = $MobA->GetTexture();
			}
		}
		$MobB->WearChange($slot, $Material, $Color);
	}
	
	$PrimaryModel = $MobA->GetEquipmentMaterial(7);
	$SecondaryModel = $MobA->GetEquipmentMaterial(8);
	
	# NPCs can set animations and attack messages, but clients only set the model change
	if ($MobB->IsNPC())
	{
		plugin::SetWeapons($PrimaryModel, $SecondaryModel, 1);
	}
	else
	{
		$MobB->WearChange(7, $PrimaryModel, 0);
		$MobB->WearChange(8, $SecondaryModel, 0);
	}
	
	if ($CloneName)
	{
		my $CloneName = $MobA->GetCleanName();
		$MobB->TempName($CloneName);
	}
	
	
}

return 1; # Plugins may or may not require this return line.