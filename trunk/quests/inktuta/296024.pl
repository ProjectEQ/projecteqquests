##Kelekdrix,_Herald_of_Trushar (296024)

sub EVENT_SPAWN {
	quest::moveto(510,-495,6, -1, 1);
	quest::setnexthpevent(99);
}

sub EVENT_HP {
	if($hpevent==99) {
		SPAWN_MY_ADDS();
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) { #an Usher or Watcher died
		if(!$entity_list->GetMobByNpcTypeID(296025) && !$entity_list->GetMobByNpcTypeID(296026)) { # No Usher or Watcher left
			quest::modifynpcstat("special_attacks","SQUMCNIDf"); #go active
		}
	quest::settimer("SpawnAdds",300); 
	}
}


sub EVENT_TIMER {
	if($timer eq "SpawnAdds") {
		if(!$entity_list->GetMobByNpcTypeID(296025) && !$entity_list->GetMobByNpcTypeID(296026)) { #No Usher or Watcher left
			SPAWN_MY_ADDS();
			quest::stoptimer("SpawnAdds");
		}
	} elsif($timer eq "BanishTop") { #Banish top on hate list
		my $TopHate = $npc->GetHateTop()->GetName();
		quest::say("Begone $TopHate");
		$entity_list->GetClientByName("$TopHate")->GMMove(0, 65, -2, 131);
	}
}



sub EVENT_COMBAT {
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
	my $instid = quest::GetInstanceID("inktuta",0);
	quest::setglobal($instid.'_inktuta_status',2,3,"H6");
	quest::depopall(296025);
	quest::depopall(296026);
}

sub SPAWN_MY_ADDS {
	#go inactive
    quest::modifynpcstat("special_attacks","ABfHG");
	quest::stop();
	$npc->WipeHateList();
	#Spawn 3 Watcher/Usher
	quest::spawn2(quest::ChooseRandom(296025,296026),0,0,357,-549,-3,63); 
	quest::spawn2(quest::ChooseRandom(296025,296026),0,0,357,-451,-2,63);
	quest::spawn2(quest::ChooseRandom(296025,296026),0,0,285,-493,-2,63);
	quest::stoptimer("BanishTop");
}