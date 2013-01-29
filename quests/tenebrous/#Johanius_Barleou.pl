sub EVENT_SAY {
	if(($text=~/hail/i) && ($faction < 6)) {
		quest::say("Greetings traveler! You seem like a brave individual for having dared the Tenebrous Mountains without a patrol of Validus Custodus to defend you! I am need of some assistance in an [urgent matter]!");
	}
	if(($text=~/hail/i) && ($faction > 5)) {
		quest::say("You are a brave individual but unfortunately I cannot trust that you will use what I have to offer to its fullest potential against the foes of Katta Castellum. Perhaps when you have established a stronger reputation as a vampyre slayer I will aid you further.");
	}	
	if(($text=~/urgent matter/i) && ($faction < 6)) {
		quest::say("My sister and my beloved Lyrra have been captured by the vile blood suckers are being held in the largest of their dark settlements. I can not face that number of blood suckers alone. Are you prepared to slay the wicked undead?");
	}
	if(($text=~/prepared to slay/i) && ($faction < 6)) {
		quest::say("Excellent, I commend you in advance for your courage. Let us make haste lest something awful happen to my loved ones!");
		if($x == 1749 && $y == 8) {
			quest::start(1);
		}
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 15) {
		quest::spawn2(172074,0,0,-377,1268,-28,0);
		quest::spawn2(172073,0,0,-366,1254,-28,0);
		quest::spawn2(172136,0,0,-395,1360,-40,0);
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::spawn2(172111,2,0,$x,$y,$z,$h);
		quest::depop_withtimer();
	}
	if($signal == 2) {
		quest::depop_withtimer();
	}
}
