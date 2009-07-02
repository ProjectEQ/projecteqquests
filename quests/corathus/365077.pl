#Deadly mushroom
sub EVENT_SPAWN
{
	settimer("wither", 60);
	settimer("cast", 3);
}

sub EVENT_TIMER
{
	if($timer eq "wither")
	{
		stoptimer("wither");
		quest::emote("withers and dies.");
		quest::depop();
	}
	elsif($timer eq "cast")
	{
	}
}

sub EVENT_DEATH
{
	stoptimer("wither");
	stoptimer("cast");
}