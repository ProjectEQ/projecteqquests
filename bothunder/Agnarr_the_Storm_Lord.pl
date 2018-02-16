# NPCID: 209026 Agnarr_the_Storm_Lord

sub EVENT_SPAWN {
	quest::setnexthpevent(98); #spawn first giant at 98%
}

sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::settimer("fail_timer",7200);
		quest::signalwith(209033,1,1); #portals start spawning
	} else {
		quest::signalwith(209033,2,1); #if lost aggro, stop portals from spawning
	}
}


sub EVENT_HP {
	if ($hpevent == 98) {
            	quest::spawn2(209115,0,0,-1083.25,-1741,2251.75,200); #first giant
		quest::setnexthpevent(75); #spawn next giant at 75
	} elsif ($hpevent == 75) {
		quest::spawn2(209104,0,0,-888,-1623,2252,200); #second giant
		quest::setnexthpevent(50); #spawn next giant at 50
	} elsif ($hpevent == 50) {
		quest::spawn2(209105,0,0,-888,-1890,2252,18); #third giant
		quest::setnexthpevent(25); #spawn next giant at 25
	} elsif ($hpevent == 25) {
		quest::spawn2(209106,0,0,-1017,-1717,2252,132); #fourth giant
	}
}

sub EVENT_TIMER {
	if($timer eq "fail_timer") { #took too long. fail
		quest::stoptimer("fail_timer");
		quest::signalwith(209033,2,1); #portals stop spawning
		quest::depop_withtimer();
	}
	
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(209114,0,0,$x,$y,$z,$h); #Planar Projection
	quest::spawn2(209108,0,0,-469,-1754,2351.2,395.2); #Karana upstairs
	quest::stoptimer("fail_timer");
	quest::signalwith(209033,2,1); #stop portals from spawning
}
