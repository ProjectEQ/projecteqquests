my $count = 0;

sub EVENT_SPAWN {
	quest::settimer("checks",125);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 800 || $zonetime < 1999)) {
		quest::start(36);
	}
	if (($count == 1) && ($zonetime < 800 || $zonetime > 1999)) {
		quest::stop;
		quest::moveto(-630,-71,-24.75,324);
	}	
	if ($count ==2 ) {
	quest::settimer("checks",125);
	$count = 0;
	}
}
