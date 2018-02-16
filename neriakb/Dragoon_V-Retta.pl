my $count = 0;

sub EVENT_SPAWN {
	quest::settimer("checks",120);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 800 || $zonetime < 1999)) {
		quest::start(35);
	}
	if (($count == 1) && ($zonetime < 800 || $zonetime > 1999)) {
		quest::stop;
		quest::moveto(-639,-85,-24.75,33);
	}
	if ($count ==2 ) {
	quest::settimer("checks",120);
	$count = 0;
	}
} 
