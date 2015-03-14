sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Over my dead body!");
	}
	if($signal==2) {
		quest::SetRunning(1);
		quest::start(8);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==4) {
		quest::SetRunning(0);
	}
	if($wp==9) {
		quest::stop();
	}
}


	