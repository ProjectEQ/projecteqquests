sub EVENT_SPAWN {
my $min = 1;
my $range = 4;
my $randomspawn = int(rand($range)) + $min;
plugin::RandomRoam(500, 500);
quest::settimer(1,$randomspawn);
}

sub EVENT_TIMER {
plugin::RandomRoam(500, 500);
}