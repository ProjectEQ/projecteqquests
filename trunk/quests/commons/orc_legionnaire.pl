sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Come feel the steel of an orc legionnaire!!");
	}
}

sub EVENT_DEATH{
	quest::say("Aaarrghh!!  The Deathfist shall hunt you down.  My death will not go unnoticed.");
}