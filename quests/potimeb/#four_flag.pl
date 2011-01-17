sub EVENT_SPAWN {
	quest::set_proximity($x - 175, $x + 175, $y - 175, $y + 175, $z - 20, $z + 20);
}

sub EVENT_ENTER {
	if (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} < 4) {
		quest::setglobal("potimeLockout", 4, 5, "D5");
	} 
}