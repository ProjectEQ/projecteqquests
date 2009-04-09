sub EVENT_SPAWN {
	quest::moveto(1011,1081,274);	# Start walking to Deyid's spawn point, will probably require a very slow walk speed for dramatic effect
}

sub EVENT_SIGNAL {
	if ($signal == 0) {quest::depop();}	# Depop all at once, instead of one at a time with quest::depopall()
}