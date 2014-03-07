##Kelekdrix,_Herald_of_Trushar (296024)
my $instid;

sub EVENT_SPAWN {
	quest::moveto(510,-495,6, -1, 1);
	quest::setnexthpevent(99);
}

sub EVENT_HP {
	if($hpevent==99) {
		quest::spawn_condition("inktuta", 1, 1); #Start Usher/Watcher spawns
		$npc->WipeHateList();
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) { #an Usher or Watcher died
		if(!$entity_list->IsMobSpawnedByNpcTypeID(296025) && !$entity_list->IsMobSpawnedByNpcTypeID(296026)) { # No Usher or Watcher left
			quest::modifynpcstat("special_attacks","SQUMCNIDf"); #go active
		}
	} elsif ($signal == 2) { #Usher/Watcher spawned, go inactive
		quest::modifynpcstat("special_attacks","ABfHG");
		$npc->WipeHateList();
		quest::stoptimer("BanishTop");
	}
}


sub EVENT_TIMER {
	if($timer eq "BanishTop") { #Banish top on hate list
		my $TopHate = $npc->GetHateTop();
		quest::say("Begone " . $TopHate->GetName());
		$npc->SetHate($TopHate,1,1);
		my $MoveName = $entity_list->GetClientByName($TopHate->GetName());
		$MoveName->MovePCInstance(296, $instid, 210, -500, -26, 245);
	}
}



sub EVENT_COMBAT {
	$instid = quest::GetInstanceID("inktuta",0);
	if ($combat_state == 1) {
		quest::settimer("BanishTop", 45);
	} else {
		quest::stoptimer("BanishTop");
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::emote("cries out, her booming alto echoing with contempt,");
	quest::say("Your victory here is hollow. With my death, the way to the lower reaches is unsealed. The denizens below destroy everything they touch. You will suffer their wrath!");
	quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
	$entity_list->FindDoor(41)->SetLockPick(0);
	quest::spawn2(296027,0,0,90,-515,-27,64); #Mimezpo_the_Oracle
	quest::spawn2(296077,0,0,526,-495,7,193);
	quest::setglobal($instid.'_inktuta_status',2,3,"H6");
	quest::spawn_condition("inktuta", 1, 0); #Stop Usher/Watcher spawns
	quest::depopall(296025);
	quest::depopall(296026);
}