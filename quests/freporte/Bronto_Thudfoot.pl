sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("That was not a very intelligent thing to do.");
	}
}

sub EVENT_SIGNAL {
	quest::say("You said it, boss!  Stay clear of taking sides and you should be just fine, young one.");
}