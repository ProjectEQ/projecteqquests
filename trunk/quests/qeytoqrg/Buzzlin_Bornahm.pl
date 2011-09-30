sub EVENT_WAYPOINT_ARRIVE {
if($wp eq 1) {
	quest::SetRunning(1)
	}
if($wp eq 4) {
	quest::SetRunning(0)
	}
if($wp eq 6) {
	quest::SetRunning(1)
	}
if($wp eq 7) {
	quest::SetRunning(0)
	}
}

