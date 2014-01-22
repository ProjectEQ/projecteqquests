#Inktuta #an_incoherent_exile 296035


sub EVENT_SPAWN {
	quest::set_proximity($x-30,$x+30,$y-30,$y+30);
}

sub EVENT_ENTER {
	quest::emote("stammers, his eyes darting about nervously.");
	quest::say("Thousands! Why the chamber is literally alive with them. A multitude of skittering insects swarming about on the tiles above.");
}

sub EVENT_SAY {
	if ($text=~/awaken me from this nightmare/i) {
		quest::signalwith(296070,296035); #signal zone_status
	} else {
		exile_fail();
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
    quest::spawn2(296044,0,0,$x+5,$y,$z,$h);
    quest::spawn2(296044,0,0,$x+5,$y+10,$z,$h);
    quest::spawn2(296044,0,0,$x+5,$y-10,$z,$h);
    quest::spawn2(296044,0,0,$x+10,$y-10,$z,$h);
    quest::spawn2(296044,0,0,$x+10,$y+10,$z,$h);
    quest::spawn2(296044,0,0,$x,$y-15,$z,$h);
    quest::spawn2(296044,0,0,$x,$y+15,$z,$h);
    quest::spawn2(296044,0,0,$x+25,$y+25,$z,$h);
    quest::spawn2(296044,0,0,$x+25,$y-25,$z,$h);
    quest::spawn2(296044,0,0,$x+25,$y,$z,$h);
  }