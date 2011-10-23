sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Dark magic, aid me in slaying this fool!!");
	}
}

sub EVENT_DEATH{
	quest::say("A fallen heretic shall be avenged by dark magic.");
}