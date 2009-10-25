sub EVENT_SPAWN
{
	quest::settimer("wave", 45);
}

sub EVENT_TIMER
{
	if($timer eq "wave")
	{
		quest::settimer("wave1", 1);
		quest::settimer("wave2", 4);
		quest::settimer("wave3", 8);
	}
	elsif($timer eq "wave1")
	{
		quest::stoptimer("wave1");
		quest::spawn2(365029, 0, 0, 140, -606, -47, 17);
	}
	elsif($timer eq "wave2")
	{
		quest::stoptimer("wave2");
		quest::spawn2(365029, 0, 0, 140, -606, -47, 17);
	}
	elsif($timer eq "wave3")
	{
		quest::stoptimer("wave3");
		quest::spawn2(365029, 0, 0, 140, -606, -47, 17);
	}
}