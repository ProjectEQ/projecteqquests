sub EVENT_SPAWN {
	quest::settimer("despawn", 1800);
}

sub EVENT_TIMER {
	quest::stoptimer("despawn");
	quest::depop();
} 