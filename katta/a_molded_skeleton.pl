sub EVENT_SPAWN {
	quest::settimer(1,120);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_COMBAT {
	quest::emote("yearns to taste your living flesh!");
}

sub EVENT_DEATH_COMPLETE {
	quest::emote("claws at the ground for a few moments and then falls still.");
}