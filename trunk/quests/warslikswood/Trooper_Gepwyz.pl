sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::say("Fear the blades of the Iksar!!");
	}
	if($combat_state == 0) {
		quest::emote("Another victory for the Legion of Cabilis!!");
	}
}

sub EVENT_DEATH {
	quest::say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
}


