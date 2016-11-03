sub EVENT_SPAWN {
        quest::settimer("global", 1);
	quest::setnexthpevent(51);
}

sub EVENT_DEATH_COMPLETE {
	quest::stoptimer("despawn");
	quest::stoptimer(1);
	quest::signalwith(214123, 214111, 0);	# Tell trigger that Vallon is dead
        quest::setglobal("vallon",1,3,"H108");
}

sub EVENT_HP {
	if($hpevent == 51) {
	quest::spawn2(214129,0,0,($x + 10),$y,$z,$h);
	quest::spawn2(214129,0,0,($x + 10),$y,$z,$h);
}	

sub EVENT_SIGNAL {
        quest::stoptimer("despawn");
        quest::stoptimer(1);
        quest::depop();
}

sub EVENT_TIMER {
	if ($timer eq "global" && defined $qglobals{vallon}) { #we place the global depop here because if used under SPAWN the NPC leaves a ghost mob.
		quest::stoptimer("global");
		quest::depop();
	}
        if ($timer eq "global" && !defined $qglobals{vallon}) {
		quest::stoptimer("global");
		quest::settimer("despawn", 2700);	# 45 min to kill him
		quest::settimer(1,1);
	}
	if ($timer eq "despawn") {
		quest::stoptimer("despawn");
		quest::stoptimer(1);
		quest::depop();
	}

	if ($timer == 1 && $x < 340 && $y < 80) {
		quest::pause(2700);
	}
}

# End of File  Zone: PoTactics  ID: 214111 -- #Vallon_Zek_ 
# Used in Rallos Zek event
