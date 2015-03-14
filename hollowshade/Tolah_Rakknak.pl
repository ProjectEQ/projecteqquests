sub EVENT_SIGNAL
    {
	# Run from zone takeover
	quest::SetRunning(1);
	quest::start(2);
	}

sub	EVENT_WAYPOINT_ARRIVE
	{
	if ($x == 2714)
		{
		# He reached his goal. Spread out.
		quest::stop();
		quest::moveto(2650, 1255, 143.12,180,1);
		}
	}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name. you may call me Tolah. Please feel free to peruse my wares. I think you'll find my prices very fair considering the risk I am taking to bring them here. If not. you can always go all the way to town to do your shopping.");
	quest::SetRunning(1);
 }
}
#END of FILE Zone:hollowshade  ID:166012 -- Tolah_Rakknak 

