sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::say("Hail. I am in a bit of a hurry. Please excuse me.");
	}
}

sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("That wasn't a very intelligent thing to do.");
	}
}
