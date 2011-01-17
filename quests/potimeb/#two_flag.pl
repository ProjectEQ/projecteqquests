sub EVENT_SPAWN {
	quest::set_proximity($x - 50, $x + 50, $y - 300, $y + 300, $z - 20, $z + 20);
}

sub EVENT_ENTER {
	if (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} < 2) {
		quest::setglobal("potimeLockout", 2, 5, "H24");
	} 
}