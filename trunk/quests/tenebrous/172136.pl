sub EVENT_SPAWN {
	my $count = 0;
	quest::settimer("kill",660);
}

sub EVENT_SIGNAL {
	$count++;
	if($count == 8){
		quest::signalwith(172032,1,0);
		quest::depop();
	}
}

sub EVENT_TIMER {
	if($timer == "kill") {
		quest::signalwith(172032,2,0);
		quest::signalwith(172074,2,0);
		quest::signalwith(172073,2,0);
		quest::depop();
	}
}

