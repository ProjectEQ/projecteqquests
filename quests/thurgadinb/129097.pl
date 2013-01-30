# night trigger for councilors  plus a timer to depop and spawn day trigger.


my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("night",1);
	if($zonetime  < 800 || $zonetime > 1699) {
		quest::signalwith(129003,1);
		quest::signalwith(129000,1);
		quest::signalwith(129028,1);
		quest::signalwith(129035,1);
		quest::signalwith(129073,1);
		quest::signalwith(129037,1);
		quest::signalwith(129075,1);
		quest::signalwith(129043,1);
		quest::signalwith(129041,1);
		quest::signalwith(129078,1);
		quest::signalwith(129036,1);
		quest::signalwith(129074,1);
		quest::signalwith(129040,1);
		quest::signalwith(129077,1);
		quest::signalwith(129039,1);
		quest::signalwith(129076,1);
		quest::signalwith(129038,1);
		quest::signalwith(129034,1);
		quest::signalwith(129072,1);
		quest::signalwith(129045,1);
		quest::signalwith(129044,1);
		quest::signalwith(129080,1);
		quest::signalwith(129042,1);
		quest::signalwith(129079,1);		
	}
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 799 && $zonetime < 1700)) {
		quest::spawn2(129098,0,0,$x,$y,$z,0);
		quest::depop_withtimer();
	}
	if ($count ==2 ) {
		$count = 0;
		quest::settimer("night",2);
	}
}