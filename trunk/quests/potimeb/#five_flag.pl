sub EVENT_SPAWN {
	quest::set_proximity($x - 40, $x + 40, $y - 300, $y + 300, $z - 20, $z + 20);
}

sub EVENT_ENTER {
	if (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} < 5) {
		quest::setglobal("potimeLockout", 5, 5, "D5");
	} 
}