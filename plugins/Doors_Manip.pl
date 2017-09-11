#######################################################
#::: Author:					Akkadius
#::: Updated: 					1-19-2014
#::: FILE:						door_plugin.pl
#::: DESCRIPTION:				This plugin handles manipulation of doors/objects in realtime
#::: Placed In:					global_player.pl
#::: EVENT Handlers: 			EVENT_SAY, EVENT_CLICKDOOR
#::: Required Perl Modules:		DBI (MySQL) connectivity
#::: Required Plugins:			plugin::LoadMysql()
######################################################

sub Doors_Manipulation_EVENT_SAY{
	#::: Declare scope variables to be used... :::#
	my $text = plugin::val('$text');
	my $door = plugin::val('$door');
	my $client = plugin::val('$client');
	my $entity_list = plugin::val('$entity_list');
	my $zonesn = plugin::val('$zonesn');
	
	if($client->GetEntityVariable("EditDoorClick") > 0){ $Door = $entity_list->GetDoorsByDoorID($client->GetEntityVariable("EditDoorClick")); }
	elsif($client->GetEntityVariable("CreateEditDoor") > 0){ $Door = $entity_list->GetDoorsByID($client->GetEntityVariable("CreateEditDoor")); }
	
	@arg = split(' ', $text); 
	if($arg[0]=~/#door/i){
		if(!$arg[1]){
			$client->Message(15, "#door - OPTIONS");
			$client->Message(15, "#door setincline <incline> - sets selected door incline");
			$client->Message(15, "#door opentype <opentype> - sets selected door opentype");
			$client->Message(15, "#door model <modelname> - Changes door model for selected door");
			$client->Message(15, "#door save - Creates database entry for highlighted door");
			$client->Message(15, quest::saylink("#door list", 1) . " - lists doors in zone");
			$client->Message(15, quest::saylink("#door edit", 1) . " - Brings up editing interface for selected door");
		}
		if($arg[1] =~/save/i){
			$Door->CreateDatabaseEntry();
			$client->Message(15, "Door saved");
		}
		if($arg[1] =~/movetome/i){
			$Door->SetLocation($client->GetX(), $client->GetY(), $client->GetZ());
		}
		if($arg[1] =~/create/i){
			if($arg[2]){
				if($arg[3]){ $size = $arg[3]; } else { $size = 100; }
				$ID = quest::createdoor(uc($arg[2]), $client->GetX(), $client->GetY(), $client->GetZ(), $client->GetHeading(), 58, $size); 
				$client->SetEntityVariable("CreateEditDoor", $ID);
				$client->Message(15, "Created Door ID: " . $ID);
			} else { $client->Message(15, "Usage: #door create modelname [size=100]"); }
		}
		if($arg[1] =~/changemodelqueue/i){
			$client->Message(15, "Type name of new model, current model is " . $Door->GetModelName());
			$client->Message(15, "#door model <modelname> or select from " . quest::saylink("#door showmodelszone", 1, "Local Zone") . " " . quest::saylink("#door showmodelsglobal", 1, "Global"));
		}
		if($arg[1] =~/size/i){
			$Door->SetSize($arg[2]);
		}
		if($arg[1] =~/showmodelsglobal/i){
			$connect = plugin::LoadMysql();
			$ModelsToSelectFrom = "";
			$client->Message(15, "Loading files...");
			$query_handle = $connect->prepare("SELECT file_from FROM `cust_obj_data` WHERE `object_name` LIKE '%IT%' AND zoneid = 0 AND object_name NOT LIKE '%OBJ%' GROUP by file_from;"); $query_handle->execute();
			while(@row = $query_handle->fetchrow_array()){
				if(length($ModelsToSelectFrom) > 4000){
					$client->Message(15, $ModelsToSelectFrom); 
					$ModelsToSelectFrom = quest::saylink("#door showmodelsfromfile " . $row[0], 1, $row[0]) . "-";
				}else{
					$ModelsToSelectFrom .= quest::saylink("#door showmodelsfromfile " . $row[0], 1, $row[0]) . "-";
				}
			}
			$client->Message(15, $ModelsToSelectFrom);
		}
		if($arg[1] =~/showmodelsfromfile/i){
			$connect = plugin::LoadMysql();
			$ModelsToSelectFrom = "";
			$client->Message(15, "Loading models from " . $arg[2]);
			$query_handle = $connect->prepare("SELECT `object_name` FROM `cust_obj_data` WHERE `file_from` = '". $arg[2] . "';"); $query_handle->execute();
			while(@row = $query_handle->fetchrow_array()){
				if(length($ModelsToSelectFrom) > 4000){
					$client->Message(15, $ModelsToSelectFrom); $ModelsToSelectFrom = quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}else{
					$ModelsToSelectFrom .= quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}
			}
			$client->Message(15, $ModelsToSelectFrom);
		}
		if($arg[1] =~/showmodelszone/i){
			$connect = plugin::LoadMysql();
			$ModelsToSelectFrom = "";
			$client->Message(15, "Loading models from $zonesn");
			$query_handle = $connect->prepare("SELECT `object_name` FROM `cust_obj_data` WHERE `zonesn` = '". $zonesn . "';"); $query_handle->execute();
			while(@row = $query_handle->fetchrow_array()){
				if(length($ModelsToSelectFrom) > 4000){
					$client->Message(15, $ModelsToSelectFrom); 
					$ModelsToSelectFrom = quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}else{
					$ModelsToSelectFrom .= quest::saylink("#door model " . $row[0], 1, $row[0]) . "-";
				}
			}
			$client->Message(15, $ModelsToSelectFrom);
		}
		if($arg[1] =~/list/i){ @doors = $entity_list->GetDoorsList(); 
			foreach $door (@doors){ 
				$client->Message(15, "ID: " . $door->GetDoorID() . " " . quest::saylink("#gmgoto " . int($door->GetX()) . " " . int($door->GetY()) . " " . int($door->GetZ())	, 1, $door->GetModelName()) . " X: " . $door->GetX() . " Y: " . $door->GetY() . " Z: " . $door->GetZ() . " Size: " . $door->GetSize() . " Open Type: " . $door->GetOpenType()); 
			} 
		}
		if($arg[1] =~/model/i){ if($arg[2]){ $Door->SetModelName(uc($arg[2])); } }
		if($arg[1] =~/opentype/i){ if($arg[2]){ $Door->SetOpenType($arg[2]); } }
		if($arg[1] eq "setincline"){
			if($arg[2]){  $Door->SetIncline($arg[2]);  }
			return;
		}
		if($arg[1] eq "setinclineinc"){
			if($arg[2]){  $Door->SetIncline($Door->GetIncline() + $arg[2]);  }
			#::: Incline Options #::: 
			if(!$arg[2]){
				$InclineOptions = "";
				%IncOptions = (
					1 => [.01, "Upright"],
					2 => [130, "+ 90 Degrees"],
					3 => [255, "+ 180 Degrees"],
					4 => [385, "+ 270 Degrees"],
					5 => [512.5, "+ 360 Degrees"],
				);
				$n = 1;
				while($IncOptions{$n}[0]){ $InclineOptions .= quest::saylink("#door setincline " . $IncOptions{$n}[0], 1, $IncOptions{$n}[1]) . " | ";  $n++; }
				$InclineOptionsP = ""; $InclineOptionsM = "";
				for($i = 0; $i <= 100; $i+=10){ if($i == 0){ $Num = 1; }else{ $Num = $i } $InclineOptionsP .= quest::saylink("#door setinclineinc " . $Num, 1, " ". abs($Num)); }
				for($i = -100; $i <= 0; $i+=10){ if($i == 0){ $Num = -1; }else{ $Num = $i } $InclineOptionsM .= quest::saylink("#door setinclineinc " . $Num, 1, " ". abs($Num)); }
				$client->Message(15, "Incline: [" . $InclineOptions . "]");
				$client->Message(15, "Incline Increments: [" . $InclineOptionsM  . " - | + " . $InclineOptionsP . "]");
			}
		}
		if($arg[1] =~/invertstate/i){
			$connect = plugin::LoadMysql();
			$query = "UPDATE `doors` SET `invert_state` = " . $arg[2] . " WHERE `id` = " . $Door->GetDoorDBID();
			$query_handle = $connect->prepare($query); $query_handle->execute();
			$client->Message(15, $query);
			$client->Message(15, "Reload Doors? " . quest::saylink("#reloadstatic", 0, "#reloadstatic"));
		}
		if($arg[1] =~/edit/i){
			if($client->GetEntityVariable("EditDoorClick") > 0){ $Door = $entity_list->GetDoorsByDoorID($client->GetEntityVariable("EditDoorClick")); }
			elsif($client->GetEntityVariable("CreateEditDoor") > 0){ $Door = $entity_list->GetDoorsByID($client->GetEntityVariable("CreateEditDoor")); }
			else { $client->Message(15, "You don't have a door selected to edit!"); return; }
			if($Door->GetDoorID() > 0 && $Door->GetDoorID() < 255){ $InvertState = " Invertstate [" . quest::saylink("#door invertstate 0", 1, "0") . " - " . quest::saylink("#door invertstate 1", 1, "1") . "]"; } else{ $InvertState = ""; }
			if(!$arg[2] && !$arg[3]){ $client->Message(15 ,"Door Selected: ID:" . $Door->GetDoorID() . " NAME: " . $Door->GetModelName() . " Opentype: " . $Door->GetOpenType() . $InvertState); }
			@MoveOptions = ("MoveX", "MoveY", "MoveZ", "MoveH", "SetSize");
			if($arg[1] && !$arg[2]){
				$OptionsXP = ""; $OptionsXM = ""; $OptionsYP = ""; $OptionsYM = ""; $OptionsZP = ""; $OptionsZM = ""; $OptionsHP = ""; $OptionsHM = ""; $OptionsSP = ""; $OptionsSM = "";
				foreach $val (@MoveOptions){
					if($val eq "MoveX"){
						$OptionsXP .= quest::saylink("#door edit MoveX .25", 1, " .25");
						for($i = 0; $i <= 15; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsXP .= quest::saylink("#door edit MoveX " . $Num, 1, " ". abs($Num)); }
						for($i = -15; $i <= 0; $i+=5){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsXM .= quest::saylink("#door edit MoveX " . $Num, 1, " ". abs($Num)); }
						$OptionsXM .= quest::saylink("#door edit MoveX -.25", 1, " .25");
					}
					if($val eq "MoveY"){
						$OptionsYP .= quest::saylink("#door edit MoveY .25", 1, " .25");
						for($i = 0; $i <= 15; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsYP .= quest::saylink("#door edit MoveY " . $Num, 1, " ". abs($Num)); }
						for($i = -15; $i <= 0; $i+=5){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsYM .= quest::saylink("#door edit MoveY " . $Num, 1, " ". abs($Num)); }
						$OptionsYM .= quest::saylink("#door edit MoveY -.25", 1, " .25");
					}
					if($val eq "MoveZ"){
						$OptionsZP .= quest::saylink("#door edit MoveZ .25", 1, " .25");
						for($i = 0; $i <= 15; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsZP .= quest::saylink("#door edit MoveZ " . $Num, 1, " ". abs($Num)); }
						for($i = -15; $i <= 0; $i+=5){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsZM .= quest::saylink("#door edit MoveZ " . $Num, 1, " ". abs($Num)); }
						$OptionsZM .= quest::saylink("#door edit MoveZ -.25", 1, " .25");
					}
					if($val eq "MoveH"){
						for($i = 0; $i <= 50; $i+=5){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsHP .= quest::saylink("#door edit MoveH " . $Num, 1, " ". abs($Num)); }
						for($i = -50; $i <= 0; $i+=5){  if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsHM .= quest::saylink("#door edit MoveH " . $Num, 1, " ". abs($Num)); }
					}
					if($val eq "SetSize"){
						for($i = 0; $i <= 100; $i+=10){ if($i == 0){ $Num = 1; }else{ $Num = $i } $OptionsSP .= quest::saylink("#door edit SetSize " . $Num, 1, " ". abs($Num)); }
						for($i = 0; $i >= -100; $i-=10){ if($i == 0){ $Num = -1; }else{ $Num = $i } $OptionsSM .= quest::saylink("#door edit SetSize " . $Num, 1, " ". abs($Num)); }
					}
				}
				$client->Message(15, "NAME: [" . $Door->GetModelName() . "] [" . quest::saylink("#door save", 1, "SAVE") . "] [" . quest::saylink("#door changemodelqueue", 1, "Change Model") . "]" . " [" . quest::saylink("#door setinclineinc", 1, "Incline") . "]");
				$client->Message(15, "[". $OptionsXM . " - [X] +" . $OptionsXP . "]");
				$client->Message(15, "[". $OptionsYM . " - [Y] + " . $OptionsYP . "]");
				$client->Message(15, "[". $OptionsZM . " - [Z] + " . $OptionsZP . "]");
				$client->Message(15, "[". $OptionsHM . " - [H] + " . $OptionsHP . "]");
				$client->Message(15, "[". $OptionsSM . " - [SIZE] + " . $OptionsSP . "]");
			}
			if($arg[3]){
				$XM = 0; $YM = 0; $ZM = 0; $HM = 0; $Size = 0;
				if($arg[2] eq "MoveX"){ $XM = $arg[3]; }
				if($arg[2] eq "MoveY"){ $YM = $arg[3]; }
				if($arg[2] eq "MoveZ"){ $ZM = $arg[3]; }
				if($arg[2] eq "MoveH"){ $HM = $arg[3]; }
				if($arg[2] eq "SetSize"){ $Size = $arg[3]; }
				#quest::say("DEBUG $XM - $YM - $ZM - $HM");
				$Door->SetLocation($Door->GetX() + $XM, $Door->GetY() + $YM, $Door->GetZ()+ $ZM);
				$Door->SetHeading($Door->GetHeading() + $HM);
				$Door->SetSize($Door->GetSize() + $Size);
			}
			#::: Coordinate Helpers
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (51, '-X', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (52, '+X', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (53, '-Y', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			# REPLACE INTO `npc_types` (`id`, `name`, `lastname`, `level`, `race`, `class`, `bodytype`, `hp`, `mana`, `gender`, `texture`, `helmtexture`, `size`, `hp_regen_rate`, `mana_regen_rate`, `loottable_id`, `merchant_id`, `alt_currency_id`, `npc_spells_id`, `npc_faction_id`, `adventure_template_id`, `trap_template`, `mindmg`, `maxdmg`, `attack_count`, `npcspecialattks`, `aggroradius`, `face`, `luclin_hairstyle`, `luclin_haircolor`, `luclin_eyecolor`, `luclin_eyecolor2`, `luclin_beardcolor`, `luclin_beard`, `drakkin_heritage`, `drakkin_tattoo`, `drakkin_details`, `armortint_id`, `armortint_red`, `armortint_green`, `armortint_blue`, `d_meele_texture1`, `d_meele_texture2`, `prim_melee_type`, `sec_melee_type`, `runspeed`, `MR`, `CR`, `DR`, `FR`, `PR`, `Corrup`, `see_invis`, `see_invis_undead`, `qglobal`, `AC`, `npc_aggro`, `spawn_limit`, `attack_speed`, `findable`, `STR`, `STA`, `DEX`, `AGI`, `_INT`, `WIS`, `CHA`, `see_hide`, `see_improved_hide`, `trackable`, `isbot`, `exclude`, `ATK`, `Accuracy`, `slow_mitigation`, `version`, `maxlevel`, `scalerate`, `private_corpse`, `unique_spawn_by_name`, `underwater`, `isquest`, `emoteid`) VALUES (54, '+Y', NULL, 1, 127, 1, 11, 31, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 'ZiGH', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 28, 1.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 75, 75, 75, 75, 80, 75, 75, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0);
			if(!$entity_list->GetNPCByNPCTypeID(51)){  quest::spawn2(51, 0, 0, ($Door->GetX() + $XM - 15), $Door->GetY() + $YM, $Door->GetZ()+ $ZM, 0); }else{ my $ent = $entity_list->GetNPCByNPCTypeID(51); $ent->GMMove(($Door->GetX() + $XM - 15), $Door->GetY() + $YM, $Door->GetZ() + $ZM + 5, 0); }
			if(!$entity_list->GetNPCByNPCTypeID(52)){  quest::spawn2(52, 0, 0, ($Door->GetX() + $XM + 15), $Door->GetY() + $YM, $Door->GetZ()+ $ZM, 0);  }else{ my $ent = $entity_list->GetNPCByNPCTypeID(52); $ent->GMMove(($Door->GetX() + $XM + 15), $Door->GetY() + $YM, $Door->GetZ() + $ZM + 5, 0); }
			if(!$entity_list->GetNPCByNPCTypeID(53)){  quest::spawn2(53, 0, 0, $Door->GetX() + $XM, ($Door->GetY() + $YM - 15), $Door->GetZ()+ $ZM, 0);  }else{ my $ent = $entity_list->GetNPCByNPCTypeID(53); $ent->GMMove($Door->GetX() + $XM, ($Door->GetY() + $YM - 15), $Door->GetZ() + $ZM + 5, 0); }
			if(!$entity_list->GetNPCByNPCTypeID(54)){  quest::spawn2(54, 0, 0, $Door->GetX() + $XM,  ($Door->GetY() + $YM + 15), $Door->GetZ()+ $ZM, 0);  }else{ my $ent = $entity_list->GetNPCByNPCTypeID(54); $ent->GMMove($Door->GetX() + $XM, ($Door->GetY() + $YM + 15), $Door->GetZ() + $ZM + 5, 0); }
		}
	}
}

sub Doors_Manipulation_EVENT_CLICKDOOR{
	my $doorid = plugin::val('$doorid');
	my $client = plugin::val('$client');
	$client->Message(15, "Door $doorid [" . quest::saylink("Close Door $doorid", 1, "Close Door") . "][" . quest::saylink("Open Door $doorid", 1, "Open Door") . "] [" . quest::saylink("#door edit", 1, "Edit Door") . "]");
	$client->SetEntityVariable("EditDoorClick", $doorid);
}