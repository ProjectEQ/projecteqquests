sub EVENT_SPAWN {
	quest::settimer(1,120);
}

sub EVENT_TIMER {
	$npc->Depop(1);
}

sub EVENT_COMBAT {
	quest::emote("grins through missing lips and attack!");
}

sub EVENT_DEATH {
	quest::say("Destroy my master and end my suffering");
}