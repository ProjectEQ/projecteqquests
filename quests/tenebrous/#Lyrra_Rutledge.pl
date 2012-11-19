sub EVENT_SPAWN {
	$npc->SetAppearance(1);
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::start(3);
		quest::say("Johanius my love! You and your companions have rescued us from those horrible creatures!");
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
