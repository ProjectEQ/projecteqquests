# a_vengeful_apparition (297152)
# jail mobs for ZMTZ

sub EVENT_SPAWN {
	quest::settimer("despawn", 30);
}

sub EVENT_TIMER {
	quest::depop();
}