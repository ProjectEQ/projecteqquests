sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Come and feel the blade of the Dark Bargainers.");
	}
}

sub EVENT_DEATH {
	quest::say("Start digging your grave.  The Indigo Brotherhood shall find you.");
}

