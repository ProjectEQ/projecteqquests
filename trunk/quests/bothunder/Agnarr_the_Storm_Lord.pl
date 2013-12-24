# NPCID: 209026 Agnarr_the_Storm_Lord

sub EVENT_SPAWN {
	quest::setnexthpevent(76); #spawn first giant at 75%
}

sub EVENT_AGGRO {
	quest::settimer(1,7200); #fail timer
	quest::settimer(2,60); #check for aggro
	quest::signalwith(209033,1,1); #portals start spawning
}

sub EVENT_HP {
	if ($hpevent == 76) {
		quest::spawn2(209104,0,0,-888,-1623,2252,100); #first giant
		quest::setnexthpevent(51); #spawn next giant at 50
	} elsif ($hpevent == 51) {
		quest::spawn2(209105,0,0,-888,-1890,2252,9); #second giant
		quest::setnexthpevent(26); #spawn next giant at 25
	} elsif ($hpevent == 26) {
		quest::spawn2(209106,0,0,-1017,-1717,2252,66); #third giant
	}
}

sub EVENT_TIMER {
	if($timer == 1) { #took too long. fail
		quest::stoptimer(1);
		quest::signalwith(209033,2,1); #portals stop spawning
		quest::depop_withtimer();
	} elsif ($timer == 2) {
		if(!$npc->IsEngaged()) {
			quest::signalwith(209033,2,1); #if not aggro'd, stop portals from spawning
		}
	}
	
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(209114,0,0,$x,$y,$z,$h); #Planar Projection
	quest::spawn2(209108,0,0,-469,-1754,2351.2,197.6); #Karana upstairs
	quest::stoptimer(1);
	quest::signalwith(209033,2,1); #stop portals from spawning
}