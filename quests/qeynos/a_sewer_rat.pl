sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_DEATH {
	quest::emote("squeaks as it wanders.");
}
