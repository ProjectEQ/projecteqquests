sub EVENT_WAYPOINT_ARRIVE {
	if (($zonetime < 600 || $zonetime > 1799) && ($wp == 1)) {
	quest::signalwith(1120,2,1); #Gahna Salbeen
	quest::signalwith(1095,2,1); # Bassanio Weekin
	quest::signalwith(1094,2,1);  #Solani Dayadil
	quest::signalwith(1078,2,1); # Moran Smith
	quest::signalwith(1115,2,1); ## Barthal
}
else {		
	quest::signalwith(1120,1,1); #Gahna Salbeen
	quest::signalwith(1095,1,1); #Bassanio Weekin
	quest::signalwith(1094,1,1);  #Solani Daydil
	quest::signalwith(1078,1,1);  # Moran Smith
	quest::signalwith(1115,1,1);  # Barthal
 }
}

# assign this to npc for signalwith
# quest::start();