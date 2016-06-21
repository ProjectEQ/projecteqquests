sub EVENT_CLICKDOOR {
	# gm can always use the door
	# used status > 79 because that is what bothunder/player.pl used
	if($status > 79 && ($doorid == 2 || $doorid == 3 || $doorid == 4 || $doorid == 5)) {
		quest::movepc(214,278,178,2);
	} else {
		#vallon's doors
		if($doorid == 2 || $doorid == 3) {
			#check if Vallon is up
			if(!$entity_list->IsMobSpawnedByNpcTypeID(214083)) {
				quest::movepc(214,278,178,2);
			}
		}
		#tallon's doors
		if($doorid == 4 || $doorid == 5) {
			#check if Tallon is up
			if(!$entity_list->IsMobSpawnedByNpcTypeID(214026)) {
				quest::movepc(214,278,178,2);
			}
		}
	}
}

sub EVENT_LOOT {
  if( ($looted_id == 16807) && !defined($qglobals{mage_epic_potchest}) && ($qglobals{mage_epic_fire1} == 1) ) { 
    $x = $client->GetX();
    $y = $client->GetY();
    $z = $client->GetZ();
    quest::spawn2(283157,0,0,$x,$y,$z,0); #a chest epic 1.5
	quest::setglobal("mage_epic_potchest", 1, 0, "F");
  }
}