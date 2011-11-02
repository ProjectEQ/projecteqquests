sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Death!!  Death to all who oppose the Crushbone orcs!!");
	}
}

sub EVENT_DEATH {
	quest::say("You shall have all the Crushbone orc legions on your tail for my death!");
}