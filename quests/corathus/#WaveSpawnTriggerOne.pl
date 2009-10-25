sub EVENT_SPAWN
{
	quest::settimer("wave", 45);
}

sub EVENT_TIMER
{
	if($timer eq "wave")
	{
		quest::settimer("bot1", 1);
		quest::settimer("bot2", 4);
		quest::settimer("bot3", 8);
	}
	elsif($timer eq "bot1")
	{
		quest::stoptimer("bot1");
		quest::spawn2(365029, 0, 0, 140, -606, -47, 17);
	}
	elsif($timer eq "bot2")
	{
		quest::stoptimer("bot2");
		quest::spawn2(365029, 0, 0, 140, -606, -47, 17);
	}
	elsif($timer eq "bot3")
	{
		quest::stoptimer("bot3");
		quest::spawn2(365029, 0, 0, 140, -606, -47, 17);
	}
}