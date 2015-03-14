sub EVENT_SPAWN {
	quest::setnexthpevent(60);
	quest::settimer("despawn", 3600);	# 1 hour till he despawns on his own
}

sub EVENT_HP {
	quest::signalwith(214123, 214052, 0);	# tell trigger mob mini Rallos is dead
	quest::stoptimer("despawn");
	quest::depop();
}

sub EVENT_SIGNAL {	
	quest::stoptimer("despawn");
	quest::depop();
}

sub EVENT_TIMER {
{
	quest::stoptimer("despawn");
	quest::depop();
}
}

# End of File  Zone: PoTactics  ID: 214109 -- #Rallos_Zek