sub EVENT_SPAWN {
	my $min = 1;
        my $range = 4;
	my $randomspawn = int(rand($range)) + $min;
	plugin::RandomSwim(200, 200, -392.2);
	quest::settimer(1,$randomspawn);

}

sub EVENT_TIMER {
        plugin::RandomSwim(200, 200, -392.2);
}