##fiend of flame.pl
#Trial of flame

sub EVENT_SPAWN {
	#Timer to check our position every second.
	quest::settimer("pos_check", 1);
	quest::moveto(880, -728, 55, 0, 1);
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::depop();
	}
}

sub EVENT_TIMER {
	if ($timer eq "pos_check") {
		quest::stoptimer("pos_check");
		if (($x == 880) && ($y == -728)) {
			quest::settimer("kill_me_or_lose", 60);
		}
		else {
			quest::settimer("pos_check", 1);
		}
	}
	
	elsif($timer eq "kill_me_or_lose") {
		quest::stoptimer("kill_me_or_lose");
		quest::signalwith(201417, 2, 5); # NPC: #Event_Burning_Control
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::stoptimer("kill_me_or_lose");
}
