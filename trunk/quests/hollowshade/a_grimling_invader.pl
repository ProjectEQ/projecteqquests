#Zone:hollowshade  ID:166266 -- a grimling invader

my $takeover_x=0;

sub EVENT_SPAWN
    {
	quest::SetRunning(1);
	if (($qglobals{"WarDefender"} eq "HollowshadeNorth"))
		{
		$takeover_x=1212;
		quest::start(11);
		}
	elsif (($qglobals{"WarDefender"} eq "HollowshadeEast"))
		{
		$takeover_x=-2770;
		quest::start(12);
		}
	else
		{
		$takeover_x=-620;
		quest::start(13);
		}
	}

sub EVENT_WAYPOINT_ARRIVE
	{
	# Stop grid, notify war we arrived and keep fighting if needed.
	if ($x == $takeover_x)
		{
		quest::signalwith(166257, 6, 0);
		$npc->SaveGuardSpot();
		quest::stop();
		}
	}

sub EVENT_SAY
	{
	if ($text=~/hail/i) 
		{
		quest::say("ey hthje jewjin hothjsn, ehjrio hjriosn sioowejn!!");
		}
	}

sub EVENT_DEATH
		{
		quest::stoptimer("ArrivalCheck");
		quest::say("Ayeeeeeee!!");
		}
