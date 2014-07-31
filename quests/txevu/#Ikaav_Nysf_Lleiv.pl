sub EVENT_SPAWN {
	quest::spawn_condition("txevu", 4, 1); 
	quest::setnexthpevent(20);
}

sub EVENT_COMBAT {
	if ($combat == 1) {
		quest::settimer("spawn_golem", 30);
	} elsif ($combat == 0) {
		quest::stoptimer("spawn_golem");
	}
}

sub EVENT_TIMER {
	if ($timer eq "spawn_golem") {
		quest::spawn2(297112,0,0,943,0,-368,192);
	}
}

sub EVENT_HP {
	$npc->AddAISpell(0, 1236, Charm, -1, -1, -350);
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn_condition("txevu", 4, 0);
}