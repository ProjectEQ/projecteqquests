#behemoth power source
sub EVENT_SPAWN
{
	quest::emote("starts powering the behemoth.");
	my $rand_time = int(rand(10)) + 1;
	quest::settimer("short", $rand_time);
}

sub EVENT_DEATH
{
	quest::stoptimer("short");
	quest::emote("stops powering the behemoth.");
	quest::signalwith(365019,1,0);
}

sub EVENT_TIMER
{
	if($timer eq "short")
	{
		quest::stoptimer("short");
		my $rand_time = int(rand(10)) + 1;
		quest::settimer("short", $rand_time);
		my $my_target = $npc->GetHateRandom();
		if($my_target)
		{
			$npc->CastSpell(1075, $my_target->GetID(), 10, 0);
		}
	}
}