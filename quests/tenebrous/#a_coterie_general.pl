sub EVENT_SPAWN {
	quest::settimer(1,300);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_DEATH {
	quest::emote("collapses to the ground and begins to decompose at an alarming rate.");
}