sub EVENT_SPAWN {
	if(defined $qglobals{potac_stampede}){
		quest::settimer("stamdepop",1);
	}
	else {
		quest::spawn_condition(potactics,1,1);
		quest::ze(10,"You hear the pounding of hooves.");
	}
}

sub EVENT_SIGNAL {
       my $min = 30000;
       my $range = 21600;
       my $randomspawn = int(rand($range)) + $min;
		quest::spawn_condition(potactics,1,0);
                quest::setglobal("potac_stampede",1,2,"S$randomspawn");
		quest::depop();
}

sub EVENT_TIMER {
		quest::stoptimer("stamdepop");
		quest::depop();
}