
sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::signalwith(296017,1);
	} elsif ($combat_state == 0) {
		quest::signalwith(296017, 2); 
	}
}