sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("That's it, swine!  You're outta here!");
	}
}

sub EVENT_DEATH{
	quest::say("My comrades will avenge my death.");
}

sub EVENT_SIGNAL{
	if(($signal==1) && ($x==3016) && ($y==-289)){
		quest::say("All quiet, Sergeant.");
	}
}