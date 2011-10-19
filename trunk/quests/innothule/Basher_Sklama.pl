sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("I shall pluck you limb from limb!!");
	}
	if($combat_state == 0){
		quest::say("Those who play with da Basher always gets bashed good!!");
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp."); }
}

#END of FILE Zone:innothule  ID:228 -- Basher_Sklama 

