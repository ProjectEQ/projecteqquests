sub EVENT_SIGNAL {
	if($signal==1) {
		quest::depop_withtimer();
	}
	if($signal==2) {
		quest::moveto(2733,2480,-49,390,1);
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

