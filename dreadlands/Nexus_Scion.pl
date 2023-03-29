sub EVENT_SAY {
	if ($text=~/hail/i) {
		plugin::NPCTell("Hail, traveler. If you'd like to [". quest::saylink("return",1) ."] to the Nexus, I can channel the power of these spires to send you on your way." );
	} elsif ($text=~/return/i) {
		$client->MovePC(152, 110, -462, -59, 375);
	}
}
