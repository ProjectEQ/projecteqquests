sub EVENT_SPAWN {
        my $min = 1200;
        my $range = 7200;
        my $randomspawn = int(rand($range)) + $min;
		quest::spawn_condition(potactics,1,1);
                quest::unique_spawn(214101,189,0,1194,-774,-297);
		quest::ze(10,"You hear the pounding of hooves.");
                quest::setglobal("potac_stampede",1,2,"S$randomspawn");
		quest::depop();
}