sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 4) {
		quest::say("We had best save our sentiments for later and make haste back to the safety of Katta Castellum!");
	}
	if($wp == 5) {
		quest::signalwith(172074,1);
		quest::signalwith(172073,1);
	}
	if($wp == 25) {
		quest::say("Hurry inside the gates ladies I will be in shortly after rewarding the brave individuals that assisted me in your rescue.");
	}
	if($wp == 26) {
		quest::spawn2(172166,0,0,$x,$y,$z,$h);
		quest::depop();
	}
}

