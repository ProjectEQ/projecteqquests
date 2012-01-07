sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Come and feel the blade of the Dark Bargainers.");
	}
	if($combat_state == 0) {
		quest::say("Hardly a worthy adversary.  A member of the Indigo Brotherhood deserves a much better opponent.");
	}
}

sub EVENT_DEATH {
	quest::say("Start digging your grave.  The Indigo Brotherhood shall find you.");
}

sub EVENT_SIGNAL {
	if($signal==1) {
		$npc->Depop(1);
	}
	if($signal==2) {
		quest::moveto(2733,2480,-49,195,1);
	}
	if($signal==3) {
		quest::SetRunning(1);
		quest::start(280);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==28){
		quest::SetRunning(0);
	}
}

