#behemoth power source
sub EVENT_SPAWN
{
	quest::emote("starts powering the behemoth.");
}

sub EVENT_DEATH
{
	quest::emote("stops powering the behemoth.");
	quest::signalwith(365019,1,0);
}