sub EVENT_SPAWN {
	quest::settimer(1,1200);
	quest::SetRunning(1);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_AGGRO {
	quest::say("To the death!!");
	quest::signal(12082);
	quest::signal(12154);
}

