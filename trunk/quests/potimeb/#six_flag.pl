sub EVENT_SPAWN {
	quest::set_proximity($x - 2000, $x + 2000, $y - 2000, $y + 2000, $z - 100, $z + 100);
}

sub EVENT_ENTER {
	if (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} < 6) {
		quest::setglobal("potimeLockout", 6, 5, "D7");
	} 
}