sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("Prepare to die, infidel!!");
	}
}

sub EVENT_WAYPOINT_ARRIVE{
	if(($wp==1) || ($wp==3)){
		quest::say("Hail citizens.  Sentinel Creot of the High Guard is on watch.");
	}
	if($wp==1){
		quest::SetRunning(1);
	}
	if($wp==2){
		quest::SetRunning(0);
	}
}