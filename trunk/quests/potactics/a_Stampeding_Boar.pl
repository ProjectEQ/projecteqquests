# NPCID: 214097 a_Stampeding_Boar
sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_WAYPOINT_ARRIVE {
	if ($wp == 6) {
		quest::depop();
	}
}
