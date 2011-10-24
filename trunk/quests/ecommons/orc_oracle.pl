sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("You shall bleed!!  All hail the Deathfist!!");
	}
}

sub EVENT_DEATH{
	quest::say("Aaarrghh!!  The Deathfist shall hunt you down.  My death will not go unnoticed.");
}