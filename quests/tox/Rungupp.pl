sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Bash 'n Smash!  Smash 'n Bash!  Now ur face are luk like trash!");
	}
}

sub EVENT_WAYPOINT_ARRIVE{
	if($wp==2){
		quest::SetRunning(1);
	}
}