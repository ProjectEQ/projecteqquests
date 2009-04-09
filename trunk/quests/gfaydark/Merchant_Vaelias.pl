
sub EVENT_SAY {
	my @choices = (55, 66, 77, 88, 99, 111, 222, 333, 444);
	my $r;
	for($r = 0; $r < 100; $r++) {
		quest::say("Rand: ".quest::ChooseRandom(@choices));
	}
}

