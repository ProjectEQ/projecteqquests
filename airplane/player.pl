#:: Splose
#:: Fix for zoning into airplane wiping rezz sickness (6/3/21)
sub EVENT_ENTERZONE {
	if ($status < 80) {
		if($client->BuffCount()) {
			for($i=0; $i < $client->BuffCount(); $i++) {
				if($client->FindBuffBySlot($i) !~ [756, 757, 5249]) {	#:: Rezz sickness
					$client->BuffFadeBySlot($i);
				}
			}	
		}
	}
}
