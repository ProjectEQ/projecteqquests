sub EVENT_SPAWN {
$location = plugin::Get_Location_By_Zone($zonesn);
$kai = $entity_list->GetMobByNpcTypeID(999001);
$brutus = $entity_list->GetMobByNpcTypeID(999002);
$aristotle = $entity_list->GetMobByNpcTypeID(999003);
$zeus = $entity_list->GetMobByNpcTypeID(999004);
$sherlock = $entity_list->GetMobByNpcTypeID(999005);
$ocho = $entity_list->GetMobByNpcTypeID(999006);
$toby = $entity_list->GetMobByNpcTypeID(999007);
$gustave = $entity_list->GetMobByNpcTypeID(999008);
$napoleon = $entity_list->GetMobByNpcTypeID(999009);
$sprocket = $entity_list->GetMobByNpcTypeID(999010);
$mortimer = $entity_list->GetMobByNpcTypeID(999011);
$paulie = $entity_list->GetMobByNpcTypeID(999012);
$x_loc = plugin::Get_rat_x_loc($location);
$y_loc = plugin::Get_rat_y_loc($location);
$z_loc = plugin::Get_rat_z_loc($location);
$head = plugin::Get_rat_heading($location);
	quest::settimer(1,5);
	if($qglobals{halloween_ratter_kai} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$kai){
				quest::unique_spawn(999001,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Kai
			}
		}
			
		else {
			my $newzone_kai = plugin::GetRandomFreeLocation(0,10); # Used to be 12, sleepers was causing trouble. TODO: Troubleshoot.
			quest::setglobal("halloween_ratter_kai",$newzone_kai,7,"F");
		}
	}
	if($qglobals{halloween_ratter_brutus} == $location){
		if(!$kai && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$brutus){
				quest::unique_spawn(999002,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Brutus
			}
		}
			
		else {
			my $newzone_brutus = plugin::GetRandomFreeLocation(0,12);
			quest::setglobal("halloween_ratter_brutus",$newzone_brutus,7,"F");
		}
	}

	if($qglobals{halloween_ratter_aristotle} == $location){
		if(!$brutus && !$kai && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$aristotle){
				quest::unique_spawn(999003,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Aristotle
			}
		}
			
		else {
			my $newzone_aristotle = plugin::GetRandomIndoorLocation(1,20);
			quest::setglobal("halloween_ratter_aristotle",$newzone_aristotle,7,"F");
		}
	}
	if($qglobals{halloween_ratter_zeus} == $location){
		if(!$brutus && !$aristotle && !$kai && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$zeus){
				quest::unique_spawn(999004,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Zeus
			}
		}
			
		else {
			my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
			quest::setglobal("halloween_ratter_zeus",$newzone_zeus,7,"F");
		}
	}
	if($qglobals{halloween_ratter_sherlock} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$kai && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$sherlock){
				quest::unique_spawn(999005,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: ________
			}
		}
			
		else {
			my $newzone_sherlock = plugin::GetRandomFreeLocation(0,30);
			quest::setglobal("halloween_ratter_sherlock",$newzone_sherlock,7,"F");
		}
	}
	if($qglobals{halloween_ratter_ocho} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$kai && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$ocho){
				quest::unique_spawn(999006,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Ocho
			}
		}
			
		else {
			my $newzone_ocho = plugin::GetRandomFreeLocation(0,30);
			quest::setglobal("halloween_ratter_ocho",$newzone_ocho,7,"F");
		}
	}
	if($qglobals{halloween_ratter_toby} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$kai && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$toby){
				quest::unique_spawn(999007,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Toby
			}
		}
			
		else {
			my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
			quest::setglobal("halloween_ratter_toby",$newzone_toby,7,"F");	
		}
	}
	if($qglobals{halloween_ratter_gustave} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$kai && !$napoleon && !$sprocket && !$mortimer && !$paulie){
			if(!$gustave){
				quest::unique_spawn(999008,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: __________
			}
		}
			
		else {
			my $newzone_gustave = plugin::GetRandomFreeLocation(0,40);
			quest::setglobal("halloween_ratter_gustave",$newzone_gustave,7,"F");
		}
	}
	if($qglobals{halloween_ratter_napoleon} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$kai && !$sprocket && !$mortimer && !$paulie){
			if(!$napoleon){
				quest::unique_spawn(999009,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Napoleon
			}
		}
			
		else {
			my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
			quest::setglobal("halloween_ratter_napoleon",$newzone_napoleon,7,"F");
		}
	}
	if($qglobals{halloween_ratter_sprocket} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$kai && !$mortimer && !$paulie){
			if(!$sprocket){
				quest::unique_spawn(999010,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Sprocket
			}
		}
			
		else {
			my $newzone_sprocket = plugin::GetRandomFreeLocation(0,40);
			quest::setglobal("halloween_ratter_sprocket",$newzone_sprocket,7,"F");
		}
	}
	if($qglobals{halloween_ratter_mortimer} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$kai && !$paulie){
			if(!$mortimer){
				quest::unique_spawn(999011,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Mortimer
			}
		}
			
		else {
			my $newzone_mortimer = plugin::GetRandomIndoorLocation(1,40);
			quest::setglobal("halloween_ratter_mortimer",$newzone_mortimer,7,"F");
		}
	}
	if($qglobals{halloween_ratter_paulie} == $location){
		if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$kai){
			if(!$paulie){
				quest::unique_spawn(999012,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Paulie
			}
		}
			
		else {
			my $newzone_paulie = plugin::GetRandomIndoorLocation(1,40);
			quest::setglobal("halloween_ratter_paulie",$newzone_paulie,7,"F");
		}
	}
	else {
		if($kai && $qglobals{halloween_ratter_kai} != $location){
			quest::depop(999001);
		}	
		if($brutus && $qglobals{halloween_ratter_brutus} != $location){
			quest::depop(999002);
		}
		if($aristotle && $qglobals{halloween_ratter_aristotle} != $location){
			quest::depop(999003);
		}
		if($zeus && $qglobals{halloween_ratter_zeus} != $location){
			quest::depop(999004);
		}
		if($sherlock && $qglobals{halloween_ratter_sherlock} != $location){
			quest::depop(999005);
		}
		if($ocho && $qglobals{halloween_ratter_ocho} != $location){
			quest::depop(999006);
		}
		if($toby && $qglobals{halloween_ratter_toby} != $location){
			quest::depop(999007);
		}
		if($gustave && $qglobals{halloween_ratter_gustave} != $location){
			quest::depop(999008);
		}
		if($napoleon && $qglobals{halloween_ratter_napoleon} != $location){
			quest::depop(999009);
		}
		if($sprocket && $qglobals{halloween_ratter_sprocket} != $location){
			quest::depop(999010);
		}	
		if($mortimer && $qglobals{halloween_ratter_mortimer} != $location){
			quest::depop(999011);
		}	
		if($paulie && $qglobals{halloween_ratter_paulie} != $location){
			quest::depop(999012);
		}
	}
}

sub EVENT_TIMER {
$location = plugin::Get_Location_By_Zone($zonesn);
$kai = $entity_list->GetMobByNpcTypeID(999001);
$brutus = $entity_list->GetMobByNpcTypeID(999002);
$aristotle = $entity_list->GetMobByNpcTypeID(999003);
$zeus = $entity_list->GetMobByNpcTypeID(999004);
$sherlock = $entity_list->GetMobByNpcTypeID(999005);
$ocho = $entity_list->GetMobByNpcTypeID(999006);
$toby = $entity_list->GetMobByNpcTypeID(999007);
$gustave = $entity_list->GetMobByNpcTypeID(999008);
$napoleon = $entity_list->GetMobByNpcTypeID(999009);
$sprocket = $entity_list->GetMobByNpcTypeID(999010);
$mortimer = $entity_list->GetMobByNpcTypeID(999011);
$paulie = $entity_list->GetMobByNpcTypeID(999012);
$x_loc = plugin::Get_rat_x_loc($location);
$y_loc = plugin::Get_rat_y_loc($location);
$z_loc = plugin::Get_rat_z_loc($location);
$head = plugin::Get_rat_heading($location);

	if($timer == 1){
		if($qglobals{halloween_ratter_kai} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$kai){
					quest::unique_spawn(999001,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Kai
				}
			}
			
			else {
				my $newzone_kai = plugin::GetRandomFreeLocation(0,12);
				quest::setglobal("halloween_ratter_kai",$newzone_kai,7,"F");
			}
		}
		if($qglobals{halloween_ratter_brutus} == $location){
			if(!$kai && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$brutus){
					quest::unique_spawn(999002,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Brutus
				}
			}
			
			else {
				my $newzone_brutus = plugin::GetRandomFreeLocation(0,12);
				quest::setglobal("halloween_ratter_brutus",$newzone_brutus,7,"F");			
			}
		}
		if($qglobals{halloween_ratter_aristotle} == $location){
			if(!$brutus && !$kai && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$aristotle){
					quest::unique_spawn(999003,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Aristotle
				}
			}
			
			else {
				my $newzone_aristotle = plugin::GetRandomIndoorLocation(1,20);
				quest::setglobal("halloween_ratter_aristotle",$newzone_aristotle,7,"F");
			}
		}
		if($qglobals{halloween_ratter_zeus} == $location){
			if(!$brutus && !$aristotle && !$kai && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$zeus){
					quest::unique_spawn(999004,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Zeus
				}
			}
			
			else {
				my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
				quest::setglobal("halloween_ratter_zeus",$newzone_zeus,7,"F");
			}
		}
		if($qglobals{halloween_ratter_sherlock} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$kai && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$sherlock){
					quest::unique_spawn(999005,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: ________
				}
			}
			
			else {
				my $newzone_sherlock = plugin::GetRandomFreeLocation(0,30);
				quest::setglobal("halloween_ratter_sherlock",$newzone_sherlock,7,"F");			
			}
		}
		if($qglobals{halloween_ratter_ocho} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$kai && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$ocho){
					quest::unique_spawn(999006,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Ocho
				}
			}
			
			else {
				my $newzone_ocho = plugin::GetRandomFreeLocation(0,30);
				quest::setglobal("halloween_ratter_ocho",$newzone_ocho,7,"F");
			}
		}
		if($qglobals{halloween_ratter_toby} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$kai && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$toby){
					quest::unique_spawn(999007,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Toby
				}
			}
			
			else {
				my $newzone_toby = plugin::GetRandomFreeLocation(0,30);
				quest::setglobal("halloween_ratter_toby",$newzone_toby,7,"F");	
			}
		}
		if($qglobals{halloween_ratter_gustave} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$kai && !$napoleon && !$sprocket && !$mortimer && !$paulie){
				if(!$gustave){
					quest::unique_spawn(999008,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: __________
				}
			}
			
			else {
				my $newzone_gustave = plugin::GetRandomFreeLocation(0,40);
				quest::setglobal("halloween_ratter_gustave",$newzone_gustave,7,"F");
			}
		}
		if($qglobals{halloween_ratter_napoleon} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$kai && !$sprocket && !$mortimer && !$paulie){
				if(!$napoleon){
					quest::unique_spawn(999009,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Napoleon
				}
			}
			
			else {
				my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
				quest::setglobal("halloween_ratter_napoleon",$newzone_napoleon,7,"F");
			}
		}	
		if($qglobals{halloween_ratter_sprocket} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$kai && !$mortimer && !$paulie){
				if(!$sprocket){
					quest::unique_spawn(999010,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Sprocket
				}
			}
			
			else {
				my $newzone_sprocket = plugin::GetRandomFreeLocation(0,40);
				quest::setglobal("halloween_ratter_sprocket",$newzone_sprocket,7,"F");
			}
		}
		if($qglobals{halloween_ratter_mortimer} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$kai && !$paulie){
				if(!$mortimer){
					quest::unique_spawn(999011,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Mortimer
				}
			}
			
			else {
				my $newzone_mortimer = plugin::GetRandomIndoorLocation(1,40);
				quest::setglobal("halloween_ratter_mortimer",$newzone_mortimer,7,"F");
			}
		}
		if($qglobals{halloween_ratter_paulie} == $location){
			if(!$brutus && !$aristotle && !$zeus && !$sherlock && !$ocho && !$toby && !$gustave && !$napoleon && !$sprocket && !$mortimer && !$kai){
				if(!$paulie){
					quest::unique_spawn(999012,0,0,$x_loc,$y_loc,$z_loc,$head); # NPC: #Paulie
				}
			}
			
			else {
				my $newzone_paulie = plugin::GetRandomIndoorLocation(1,40);
				quest::setglobal("halloween_ratter_paulie",$newzone_paulie,7,"F");
			}
		}
		else {
			if($kai && $qglobals{halloween_ratter_kai} != $location){
			quest::depop(999001);
			}	
			if($brutus && $qglobals{halloween_ratter_brutus} != $location){
				quest::depop(999002);
			}
			if($aristotle && $qglobals{halloween_ratter_aristotle} != $location){
				quest::depop(999003);
			}
			if($zeus && $qglobals{halloween_ratter_zeus} != $location){
				quest::depop(999004);
			}
			if($sherlock && $qglobals{halloween_ratter_sherlock} != $location){
				quest::depop(999005);
			}
			if($ocho && $qglobals{halloween_ratter_ocho} != $location){
				quest::depop(999006);
			}
			if($toby && $qglobals{halloween_ratter_toby} != $location){
				quest::depop(999007);
			}
			if($gustave && $qglobals{halloween_ratter_gustave} != $location){
				quest::depop(999008);
			}
			if($napoleon && $qglobals{halloween_ratter_napoleon} != $location){
				quest::depop(999009);
			}
			if($sprocket && $qglobals{halloween_ratter_sprocket} != $location){
				quest::depop(999010);
			}	
			if($mortimer && $qglobals{halloween_ratter_mortimer} != $location){
				quest::depop(999011);
			}	
			if($paulie && $qglobals{halloween_ratter_paulie} != $location){
				quest::depop(999012);
			}
		}
	}
}
			
sub EVENT_SIGNAL {
	if($signal == 1){
		quest::stoptimer(1);
	}		
	if($signal == 2){
		quest::settimer(1,5);
	}
}		