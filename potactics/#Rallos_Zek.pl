sub EVENT_SPAWN {
	quest::setnexthpevent(60);
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
		my $hate_target = $npc->GetHateRandom();
		quest::spawn2(214130,193,0,978,-560,133.13,385.8);
		quest::spawn2(214130,194,0,978,580,133.13,385.8);
		my @npc_list = $entity_list->GetNPCList();
		foreach $npc (@npc_list) {
			if($npc->GetNPCTypeID() == 214130) {
				$npc->AddToHateList($hate_target, 1);
			}
		}
	}
}

sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::settimer("fakeRZadds", 45);
		quest::stoptimer("despawn");
	} else {
		quest::settimer("despawn", 1020);
		quest::stoptimer("fakeRZadds");
	}
}
# End of File  Zone: PoTactics  ID: 214109 -- #Rallos_Zek
