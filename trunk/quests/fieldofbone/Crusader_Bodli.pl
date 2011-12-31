sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Hiss.. You cannot hope defeat a Crusader of Greenmist!!");
	}
}

sub EVENT_DEATH {
	quest::say("Ha ha!!  Fool..  The Crusaders of Greenmist shall torture you to death! Ha ha!!");
}

