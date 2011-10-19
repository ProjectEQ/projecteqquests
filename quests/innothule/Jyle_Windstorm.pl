sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Run!!  I have need of the hunt!!");
	}
	if($combat_state == 0){
		quest::say("Let no evil beings stand in the way of the righteousness of the Paladins of Tunare!");
	}
}

