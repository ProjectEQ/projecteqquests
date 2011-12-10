sub EVENT_SPAWN {
	quest::settimer(1,3600);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_DEATH{
   quest::emote("'s corpse screams inhumanly as he falls and bursts into a cloud of ashes blacker than the darkest night.");
}