sub EVENT_SPAWN {
	quest::settimer(1,300);
	quest::attacknpctype(quest::ChooseRandom(119166,119167,119168,119169));
}

sub EVENT_TIMER {
	quest::depop();
}

