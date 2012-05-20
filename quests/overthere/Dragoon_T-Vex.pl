sub EVENT_SIGNAL {
	if($signal==1) {
		$npc->Depop(1);
	}
	if($signal==2) {
		quest::moveto(2734,2476,-49,195,1);
	}
	if($signal==3) {
		quest::SetRunning(1);
		quest::start(279);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==28){
		quest::SetRunning(0);
	}
}
