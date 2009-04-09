sub EVENT_SPAWN {
	quest::settimer(1,3600);
}

sub EVENT_TIMER {
{
	quest::stoptimer(1);
	quest::depop;
}
}

sub EVENT_DEATH {
	quest::stoptimer(1);
	quest::spawn2(202368,0,0,$x,$y,$z,$h);
}

# End of File  Zone: PoFire  ID: 217054  -- Fennin_Ro_the_Tyrant_of_Fire