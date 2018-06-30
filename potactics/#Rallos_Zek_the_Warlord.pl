# Zone: PoTactics    ID: 214113 -- #Rallos_Zek_the_Warlord

#This is a list of the spawn2 id's of all mobs that spawn in the pit.
#There are mobs that do not spawn in the pit, that path into it.
#They are not disabled from spawning.
my @spawn2list = (44462,44639,44640,44641,44642,44646,44654,44655,44656,44657,44664,44665,44666,44667,44674,44675,44676,44677,44678,44679,44681,44682,44687,44688,44702,44703,44705,44708,44709,44710,44711,44712,44713,44715,44716,44719,44720,44721,44722,44723,44724,44727,44728,44729,44737,44738,44742,44743,44744,44745,44746,44747,44748,44749,44758,44759,44760,44761,44762,44763,44764,44765,44775,44776,44780,44781,44782,44680);

sub EVENT_SPAWN {
	quest::settimer(2,1800);   # 30 min to kill him
	foreach my $spawn2 (@spawn2list) {   # Depsawn all the mobs in the pit
		#disable the spawn2 entry for all the pit mobs.
		quest::disable_spawn2($spawn2);
		#used for testing, you can uncomment this to make them all respawn in 10 seconds after spawning rallos
		#quest::updatespawntimer($spawn2,10000); #set it all to 10 second respawn
	}
	# disable piglet from spawning and starting the stampede
	quest::disable_spawn2(157400);
}

sub EVENT_AGGRO {
        quest::settimer(1,60);
		quest::settimer("dt_outofarena",5);
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(214105,0,0,699,8,-294,128);   # spawn a_planar_projection
	quest::stoptimer(2);
	quest::stoptimer(1);
	quest::signalwith(214123, 214113);         # let the trigger know RZtW died
	quest::signalwith(214114,90,1);
	foreach my $spawn2 (@spawn2list) {   # Depsawn all the mobs in the pit
		# Set pit mobs to respawn in 30 minutes. comment this line out to not set the 30 minute timer for testing.
		quest::updatespawntimer($spawn2,1800000);
		#re-enable the spawn2 entry for all the pit mobs.
		quest::enable_spawn2($spawn2);
	}
	#set the piglet's respawn to 30 minutes.
	quest::updatespawntimer(157400,1800000);
	#re-enable the spawn2 entry for piglet
	quest::enable_spawn2(157400);
}

sub EVENT_TIMER {
	if($timer == 2) {
		foreach my $spawn2 (@spawn2list) {   # Depsawn all the mobs in the pit
			# Set pit mobs to respawn in 30 minutes. comment this line out to not set the 30 minute timer for testing.
			quest::updatespawntimer($spawn2,1800000);
			#re-enable the spawn2 entry for all the pit mobs.
			quest::enable_spawn2($spawn2);
		}
		#set the piglet's respawn to 30 minutes.
		quest::updatespawntimer(157400,1800000);
		#re-enable the spawn2 entry for piglet
		quest::enable_spawn2(157400);
		
		quest::stoptimer(2);
		quest::stoptimer(1);
		quest::depopall(214114);
		quest::depop();
	}

	if($timer == 1) {
		if($npc->IsEngaged()) {
			quest::spawn2(214114,0,0,565,-95,-293,132);
			quest::spawn2(214114,0,0,815,-100,-293,510);
			quest::spawn2(214114,0,0,815,-295,-293,136);
			quest::spawn2(214114,0,0,565,185,-293,0);
			quest::spawn2(214114,0,0,565,-95,-293,132);
			quest::spawn2(214114,0,0,565,-95,-293,132);
			quest::spawn2(214114,0,0,815,-100,-293,510);
			quest::spawn2(214114,0,0,815,-295,-293,136);
			quest::spawn2(214114,0,0,565,185,-293,0);
			my @npc_list = $entity_list->GetNPCList();
			foreach $npc (@npc_list) {
				if($npc->GetNPCTypeID() == 214114) {
					$npc->AddToHateList($npc->GetHateTop(), 1);
				}
			}
		} else {		
			quest::stoptimer(1);
		}
	}
	if($timer == "dt_outofarena") {
		my @hate_list = $npc->GetHateList();
		my $hate_count = @hate_list;
		if ($hate_count > 0) {
		  foreach $ent (@hate_list) {
			my $h_ent = $ent->GetEnt();
			if ($h_ent->IsClient()) {
			  if ($h_ent->GetX() > 950) {
				$npc->CastSpell(982,$h_ent->GetID());
			  }
			}
		  }
		}	
	}
}

# End of file   Zone: PoTactics    ID: 214113 -- #Rallos_Zek_the_Warlord 
