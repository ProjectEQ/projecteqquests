# day trigger for councilors  plus a timer to depop and spawn night trigger.

my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("day",1);
		quest::signalwith(129003,2);
		quest::signalwith(129000,2);
		quest::signalwith(129028,2);
		quest::signalwith(129035,2);
		quest::signalwith(129073,2);
		quest::signalwith(129037,2);
		quest::signalwith(129075,2);
		quest::signalwith(129043,2);
		quest::signalwith(129041,2);
		quest::signalwith(129078,2);
		quest::signalwith(129036,2);
		quest::signalwith(129074,2);
		quest::signalwith(129040,2);
		quest::signalwith(129077,2);
		quest::signalwith(129039,2);
		quest::signalwith(129076,2);
		quest::signalwith(129038,2);
		quest::signalwith(129034,2);
		quest::signalwith(129072,2);
		quest::signalwith(129045,2);
		quest::signalwith(129044,2);
		quest::signalwith(129080,2);
		quest::signalwith(129042,2);
		quest::signalwith(129079,2);	
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime  < 800 || $zonetime > 1699)) {
		quest::spawn2(129097,0,0,$x,$y,$z,0);
		quest::depop();
	}
	if ($count ==2) {
		$count = 0;
		quest::settimer("day",2);
	}
}

