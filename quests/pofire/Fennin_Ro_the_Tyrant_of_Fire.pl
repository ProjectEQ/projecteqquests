sub EVENT_SPAWN {
	quest::settimer(1,3600);
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	quest::depop();
}

sub EVENT_DEATH {
	quest::ze(1,"Loud cries of hopelessness echo throughout the burning lands. The creatures of Doomfire call out to their master, Fennin Ro the Tyrant of Fire, for his dead body now lies at the feet of the mighty adventurers.");
	quest::stoptimer(1);
	quest::spawn2(202368,0,0,$x,$y,$z,$h);
}

# End of File  Zone: PoFire  ID: 217054  -- Fennin_Ro_the_Tyrant_of_Fire
