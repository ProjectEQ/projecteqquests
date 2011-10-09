sub EVENT_WAYPOINT_ARRIVE {
	if($wp eq 14) {
	quest::say("Sir. You called for me?");
	quest::signal(1068);
	}
	if($wp eq 40) {
	quest::say("McNeal Jocub? You have been found guilty of crimes against the city of Qeynos.");
	}
	if($wp eq 41) {
	quest::signal(1099);
	}
}

sub EVENT_SIGNAL {
	quest::say("Aye sir!");
}

sub EVENT_SAY {
	if($text=~/hail/i) {
	quest::say("I have no time to talk, citizen. Please, step aside!");
	}
}
