sub EVENT_SPAWN {
my $min = 1;
my $range = 4;
my $randomspawn = int(rand($range)) + $min;
	plugin::RandomRoam(250, 250);
	quest::settimer(1,$randomspawn);
}
	
sub EVENT_TIMER {
	plugin::RandomRoam(250, 250);
}
