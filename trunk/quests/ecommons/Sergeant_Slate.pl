sub EVENT_WAYPOINT_ARRIVE{
	if(($wp==2) || ($wp==4) || ($wp==6)){
		quest::say("condition report soldier!");
		quest::signalwith(22066,1,1);
	}
	if(($wp==3) || ($wp==7)){
		quest::say("condition report soldier!");
		quest::signalwith(22035,1,1);
	}
}

sub EVENT_COMBAT{
	if($combat_state==1){
		quest::say("That's it, swine!  You're outta here!");
	}
}

sub EVENT_DEATH{
	quest::say("My comrades will avenge my death.");
}