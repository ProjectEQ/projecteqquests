#Inktuta #an_irrational_exile 296036

my $say_ready = 1;

sub EVENT_SPAWN {
	quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}

sub EVENT_ENTER {
	quest::emote("grapples with an imaginary opponent. He seems quite convinced that another humanoid is struggling against him.");
	quest::say("Raargh! This worship room is mine, ask Kelekdrix. You'll not take it!.");
}

sub EVENT_SAY {
	if ($say_ready) { 
		if ($text=~/awaken me from this nightmare/i) {
			$say_ready = 0;
			quest::settimer("set_ready",30);
			quest::signalwith(296070,296036); #signal zone_status
		} else {
			$say_ready = 0;
			quest::settimer("set_ready",30);
			exile_fail();
		}
	}
}

sub EVENT_TIMER {
	if ($timer eq "set_ready") {
		quest::stoptimer("set_ready");
		$say_ready = 1;
	}
}

sub EVENT_SIGNAL {
	if ($signal == 1) { #success
		quest::emote("blinks and a spark of sanity returns.");
		quest::say("Ah, wha . . . what? How strange. I can see clearly now.");
		quest::say("Thank you for restoring our clarity. Something in this cursed place had stolen away my sanity, and I will not allow it to happen again. Death would be preferable to that endless madness. Be warned, the gateway to the lower reaches of this temple will be unsealed soon. Leave this place before you become mad yourselves!");
	#signal from zone_status saying fail
	} elsif ($signal == 2) {
		exile_fail();
	}
}

sub exile_fail {
	# X: -305, Y: -310, Z: -50
	quest::spawn2(296044,0,0,-305,-290, $z, $h);
	quest::spawn2(296044,0,0,-320,-300, $z, $h);
	quest::spawn2(296044,0,0,-310,-300, $z, $h);
	quest::spawn2(296044,0,0,-300,-300, $z, $h);
	quest::spawn2(296044,0,0,-290,-300, $z, $h);
	quest::spawn2(296044,0,0,-320,-310, $z, $h);
	quest::spawn2(296044,0,0,-310,-310, $z, $h);
	quest::spawn2(296044,0,0,-300,-310, $z, $h);
	quest::spawn2(296044,0,0,-290,-310, $z, $h);
}
