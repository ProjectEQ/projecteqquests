sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("That's it, swine!  You're outta here!");
	}
}

sub EVENT_DEATH{
	quest::say("My comrades will avenge my death.");
}