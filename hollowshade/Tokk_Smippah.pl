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
		# He reached his goal. Spead out
		quest::stop();
		quest::moveto(2722, 1299, 143.12,180,1);
		}
	}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name. I am Tokk. perhaps you've heard of me? I'd be out in the forest aiding in the war if it weren't for some nasty wounds I took from the grunts. I'm working here as a merchant until they heal. then it's back to the fray. I'll be back out there soon. perhaps we'll raid a grimling camp together."); }
}
#END of FILE Zone:hollowshade  ID:166010 -- Tokk_Smippah 

