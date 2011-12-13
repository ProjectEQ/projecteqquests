sub EVENT_SPAWN {
	quest::settimer(1,120);
}

sub EVENT_TIMER {
	$npc->Depop(1);
}

sub EVENT_COMBAT {
	quest::emote("wails eerily as it stumbles towards you!");
}

sub EVENT_DEATH {
	quest::say("Destroy my corpse or my misery will never end!");
}