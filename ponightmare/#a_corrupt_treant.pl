sub EVENT_SIGNAL {
	if ($signal == 0) {quest::depop();}	# Depop all at once, instead of one at a time with quest::depopall()
}