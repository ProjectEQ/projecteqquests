sub EVENT_SPAWN {
	$npc->SetAppearance(1);
	quest::settimer(1,1800);
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("The Coterie of the Eternal Night is holding us captive! We can not leave until all the vampyres that reside in this village have been destroyed! If any of them are missing I assure you they will return! My brother Johanius is an experienced vampyre slayer and will coming for us soon!");
	}
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::start(3);
		quest::say("Dearest brother, how releaved I am to see you again!");
	}
	if($signal == 2) {
		quest::depop();
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 21) {
		quest::say("We will see you at home Johanius, please hurry.");
	}
}
