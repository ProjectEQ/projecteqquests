# night trigger for dragoons  plus a timer to depop and spawn day trigger.


my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("night",1);
	quest::signalwith(93087,2);
	quest::signalwith(93186,2);
	quest::signalwith(93124,2);
	quest::signalwith(93088,2);
	quest::signalwith(93084,2);
	quest::signalwith(93125,2);
	quest::signalwith(93086,2);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 599 && $zonetime < 1900)) {
		quest::spawn2(93304,0,0,$x,$y,$z,0);
		quest::depop();
	}
	if ($count ==2 ) {
		$count = 0;
		quest::settimer("night",2);
	}
}