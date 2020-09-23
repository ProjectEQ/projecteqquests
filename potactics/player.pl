sub EVENT_CLICKDOOR {
	# gm can always use the door
	# used status > 79 because that is what bothunder/player.pl used
	if($status > 79 && ($doorid == 2 || $doorid == 3 || $doorid == 4 || $doorid == 5)) {
		quest::movepc(214,278,178,2); # Zone: potactics
	} else {
		#vallon's doors
		if($doorid == 2 || $doorid == 3) {
			#check if Vallon is up
			if(!$entity_list->IsMobSpawnedByNpcTypeID(214083)) {
				quest::movepc(214,278,178,2); # Zone: potactics
			}
		}
		#tallon's doors
		if($doorid == 4 || $doorid == 5) {
			#check if Tallon is up
			if(!$entity_list->IsMobSpawnedByNpcTypeID(214026)) {
				quest::movepc(214,278,178,2); # Zone: potactics
			}
		}
		#Glykus_Helmir door
		if($doorid == 25) {
			#check if Glykus_Helmir is up
			if(!$entity_list->IsMobSpawnedByNpcTypeID(214053)) {
				quest::movepc(203,-4,-191,-628); # Zone: potranquility
			}
		}
		#Tagrin_Maldric door
		if($doorid == 26) {
			#check if Glykus_Helmir is up
			if(!$entity_list->IsMobSpawnedByNpcTypeID(214054)) {
				quest::movepc(203,-4,-191,-628); # Zone: potranquility
			}
		}
	}
}

sub EVENT_LOOT {
  if ($class eq "Magician" && $looted_id == 16807) {
	if (defined($qglobals{mage_epic_fire1}) && $qglobals{mage_epic_fire1} == 1) {
	  if (!defined($qglobals{mage_epic_potchest})) {
			quest::setglobal("mage_epic_potchest", "1", 5, "F"); 
			$x = $client->GetX();
			$y = $client->GetY();
			$z = $client->GetZ();
			quest::spawn2(283157,0,0,$x,$y,$z,0); # NPC: a_chest
		}
	  return 0;
	}
	else 
	{
		return 1;
	}
  }
}
