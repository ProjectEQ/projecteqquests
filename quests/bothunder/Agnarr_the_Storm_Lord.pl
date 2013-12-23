# NPCID: 209026 Agnarr_the_Storm_Lord
sub EVENT_SPAWN {
	quest::settimer(1,7200);
	quest::setnexthpevent(76); #spawn first giant at 75%
}

sub EVENT_AGGRO {
	quest::settimer(3,1);
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
	if($timer == 1) {
		quest::stoptimer(1);
		quest::spawn2(209026,0,0,$x,$y,$z,$h);
		quest::signalwith(209033,2,1);
		quest::depop();
	} elsif($timer == 2) {
		quest::signalwith(209033,1,1);
		quest::stoptimer(1);
		quest::stoptimer(2);
		quest::settimer(1,7200);
		quest::settimer(2,31);
	} elsif($timer == 3) {
		if($npc->IsEngaged()) {
			quest::stoptimer(1);
			quest::stoptimer(3);
			quest::settimer(1,7200);
			quest::settimer(2,31);
			quest::settimer(4,60);
			quest::signalwith(209033,1,1);
		} else {
			quest::signalwith(209033,2,1);
			quest::stoptimer(3);
		}
	} elsif($timer == 4) {
		if(!$npc->IsEngaged()) {
			quest::signalwith(209033,2,1);
			quest::stoptimer(4);
		}
	}
}

sub EVENT_DEATH_COMPLETE {
	# spawn planar projection
	quest::spawn2(202367,0,0,$x,$y,$z,$h);
	# spawn Karana up the stairs
	quest::spawn2(209108,0,0,-469,-1754,2351.2,197.6); 
	quest::stoptimer(1);
	quest::stoptimer(2);
	quest::signalwith(209033,2,1);
}