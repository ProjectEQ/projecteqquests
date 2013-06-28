sub EVENT_SPAWN {
	quest::disable_spawn2(151562);
}

sub EVENT_DEATH_COMPLETE {
     quest::enable_spawn2(151562);
}