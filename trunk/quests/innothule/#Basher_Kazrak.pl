sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("I shall pluck you limb from limb!!");
	}
	if($combat_state == 0){
		quest::say("Those who play with da Basher always gets bashed good!!");
	}
}