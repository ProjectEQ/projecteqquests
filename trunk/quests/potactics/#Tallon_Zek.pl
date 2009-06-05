sub EVENT_SPAWN {
	quest::settimer("despawn", 2700);	# 45 min to kill him
	quest::settimer(1,1);
}

sub EVENT_DEATH {
	quest::stoptimer("despawn");
	quest::stoptimer(1);
	quest::signalwith(214123, 214108, 0);	# Tell trigger that Tallon is dead
}

sub EVENT_SIGNAL {
        quest::stoptimer("despawn");
        quest::stoptimer(1);
        quest::depop();
}

sub EVENT_TIMER {
{
	quest::stoptimer(1);
	quest::settimer(1,1);
}
	if ($timer eq "despawn") {
		quest::stoptimer("despawn");
		quest::stoptimer(1);
		quest::depop();
	}
	
	if ($timer == 1 && $x < 340 && $y > -68) {
		quest::pause(2700);
	}
}

# End of File  Zone: PoTactics  ID: 214108 -- #Tallon_Zek
# Used in Rallos Zek Event