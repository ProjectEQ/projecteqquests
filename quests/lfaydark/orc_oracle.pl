sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Let me show you the high power of the Crushbone oracles!!");
	}
}

sub EVENT_DEATH {
	quest::say("You shall have all the Crushbone orc legions on your tail for my death!");
}