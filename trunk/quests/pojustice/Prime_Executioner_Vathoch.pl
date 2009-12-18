sub EVENT_SPAWN {
	#Tell the agents I'm alive
	quest::signalwith(201075,1,2);
}

sub EVENT_DEATH {
	#Tell the agents I'm dead
	quest::signalwith(201075,11,2);
	#Tell the controller it's over.
	quest::signalwith(201425,2,2);
}

sub EVENT_SIGNAL {
	if ($signal == 0) {
		quest::depop();
	}
}