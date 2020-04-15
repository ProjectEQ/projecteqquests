
sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::signalwith(296017,1); # NPC: #curse_trigger
	} elsif ($combat_state == 0) {
		quest::signalwith(296017, 2); # NPC: #curse_trigger
	}
}