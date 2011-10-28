sub EVENT_COMBAT{
	if($combat_state==0){
		quest::say("Hardly a worthy adversary.  A member of the Indigo Brotherhood deserves a much better opponent.");
	}
}

sub EVENT_DEATH{
	quest::say("Start digging your grave.  The Indigo Brotherhood shall find you.");
}