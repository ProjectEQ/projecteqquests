sub EVENT_SPAWN {
	quest::settimer("cast",5);
}

sub EVENT_TIMER {
	my $random = int(rand(3));
	if($random == 0) {
		plugin::DoAnim("cast");
	}
	if($random == 1) {
		plugin::DoAnim("cast2");
	}
	if($random == 2) {
		plugin::DoAnim("cast3");
	}
}
