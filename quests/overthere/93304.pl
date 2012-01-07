# day trigger for dragoons  plus a timer to depop and spawn night trigger.

my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("day",1);
	if ($zonetime > 599 && $zonetime < 1900) {
		quest::signalwith(93087,1);
		quest::signalwith(93186,1);
		quest::signalwith(93124,1);
		quest::signalwith(93088,1);
		quest::signalwith(93084,1);
		quest::signalwith(93125,1);
		quest::signalwith(93086,1);
	}
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime  < 600 || $zonetime > 1899)) {
		quest::spawn2(93305,0,0,$x,$y,$z,0);
		quest::depop();
	}
	if ($count ==2) {
		$count = 0;
		quest::settimer("day",2);
	}
}

