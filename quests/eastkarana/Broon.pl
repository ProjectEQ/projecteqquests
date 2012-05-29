sub EVENT_SPAWN {
	quest::disable_spawn2(151562);
}

sub EVENT_DEATH {
     quest::enable_spawn2(151562);
}