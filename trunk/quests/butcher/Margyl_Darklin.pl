

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 1) {
	quest::SetRunning(1);
	}
	if ($wp == 4) {
	quest::SetRunning(0);
	}
	if ($wp == 7) {
	quest::SetRunning(1);
	}
	if ($wp == 10) {
	quest::SetRunning(0);
	}
}
