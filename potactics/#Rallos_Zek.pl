sub EVENT_SPAWN {
	quest::setnexthpevent(60);
	quest::settimer("despawn", 1200);	# 20 min till he despawns on his own
}

sub EVENT_HP {
	quest::emote("laughs in an ominous tone of death.  'Flee whelps! Flee before the might of the Warlord!");
	quest::signalwith(214123, 214052, 0);	# tell trigger mob mini Rallos is dead
	quest::stoptimer("despawn");
	quest::depop();
}

sub EVENT_SIGNAL {	
	quest::stoptimer("despawn");
	quest::depop();
}

sub EVENT_TIMER {
	if($timer eq "despawn") {
		quest::stoptimer("despawn");
		quest::depop();
	}
	if($timer eq "fakeRZadds") {
		quest::spawn2(214130,0,0,978,-560,133.13,192.9);
		quest::spawn2(214130,0,0,978,580,133.13,192.9);
	}
}

sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::settimer("fakeRZadds", 45);
	} else {
		quest::stoptimer("fakeRZadds");
	}
}
# End of File  Zone: PoTactics  ID: 214109 -- #Rallos_Zek
