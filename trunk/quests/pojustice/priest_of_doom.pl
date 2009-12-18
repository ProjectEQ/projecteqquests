sub EVENT_DEATH {
	quest::signalwith(201439, 0, 5);
	quest::signalwith(201425, 3, 5);
}

sub EVENT_SIGNAL {
	if ($signal == 0) {
		quest::depop();
	}
}