#Guard_Kliknaw  Hollowshade  ID  166078
# items: 6220, 6221

sub EVENT_SIGNAL
    {
	quest::SetRunning(1);
	quest::start(2);
	}

sub	EVENT_WAYPOINT_ARRIVE
	{
	if ($x == 2714)
		{
		# He reached his goal.
		quest::stop();
		quest::moveto(2637, 1226, 143.12,360,1);
		}
	}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6220 =>1 )) {
  quest::emote("yells, 'Head count! Head count time!' A moment later he says");
    quest::say("I'm pretty sure that they're all here. Just take this back and act like your didn't just see that.");
    quest::emote("He winks and hands you the report.");
    quest::summonitem(6221); # Item: Daily Status Report
    quest::faction( 1513,10 ); # Faction: Guardians of Shar Vahl
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
