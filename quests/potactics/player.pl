
sub EVENT_CLICKDOOR {
	# gm can always use the door
	# used status > 79 because that is what bothunder/player.pl used
	if($status > 79 && ($doorid == 2 || $doorid == 3 || $doorid == 4 || $doorid == 5)) {
		quest::movepc(214,278,178,2);
	} else {
		#vallon's doors
		if($doorid == 2 || $doorid == 3) {
			#check if Vallon is up
			if(!$entity_list->GetMobByNpcTypeID(214083)) {
				quest::movepc(214,278,178,2);
			}
		}
		#tallon's doors
		if($doorid == 4 || $doorid == 5) {
			#check if Tallon is up
			if(!$entity_list->GetMobByNpcTypeID(214026)) {
				quest::movepc(214,278,178,2);
			}
		}
	}
}
