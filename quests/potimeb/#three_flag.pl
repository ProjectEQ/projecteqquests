sub EVENT_SPAWN {
	quest::set_proximity($x - 70, $x + 70, $y - 175, $y + 175, $z - 20, $z + 20);
}

sub EVENT_ENTER {
	if (defined($qglobals{potimeLockout}) && $qglobals{potimeLockout} < 3) {
		quest::setglobal("potimeLockout", 3, 5, "D3");
	} 
}