sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Die, dog!!");
	}
	if($combat_state==0){
		quest::say("Let your death be a warning to all who dare oppose the Freeport Militia!");
	}
}
