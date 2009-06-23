sub EVENT_SPAWN {
        my $min = 1200;
        my $range = 7200;
        my $randomspawn = int(rand($range)) + $min;
                quest::SetRunning(1);
		quest::spawn_condition(potactics,1,1);
                quest::unique_spawn(214101,189,0,1194,-774,-297);
		quest::ze(10,"You hear the pounding of hooves.");
                quest::setglobal("potac_stampede",1,2,"S$randomspawn");
		quest::settimer("stamboars",1);
}

sub EVENT_TIMER {
	if ($x == 1202 && $y == -351){
		quest::stoptimer("stamboars");
		quest::spawn_condition(potactics,1,0);
		quest::depopall(214097);
                quest::depop();
	}
}
