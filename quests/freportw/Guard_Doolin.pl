sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("You're not welcome in Freeport");
	}
	if($combat_state==0){
		quest::say("Let your death be a warning to all who dare oppose the Freeport Militia!");
	}
}
