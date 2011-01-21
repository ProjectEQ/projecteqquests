sub EVENT_SPAWN {
	#Set a random timer between 1 and 5
	my $StartMove = int(rand(5)) + 1;
	quest::settimer("roam", $StartMove);
}

sub EVENT_TIMER {
	if ($timer eq "roam") {
		quest::stoptimer("roam");
		plugin::StraightPath(100,100);
		my $NextMove = int(rand(3)) + 1;
		quest::settimer("roam", $NextMove);
	}
}