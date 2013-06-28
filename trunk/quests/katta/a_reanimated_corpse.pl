sub EVENT_SPAWN {
	quest::settimer(1,120);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_COMBAT {
	quest::emote("grins through missing lips and attack!");
}

sub EVENT_DEATH_COMPLETE {
	quest::say("Destroy my master and end my suffering");
}