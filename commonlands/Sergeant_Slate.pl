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

