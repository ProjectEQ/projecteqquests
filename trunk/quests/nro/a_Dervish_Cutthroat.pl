sub EVENT_COMBAT {
	my $NPCRace = $npc->GetRace();
	if($combat_state == 1){
		if($NPCRace==54){
			quest::say("Orc stomp, orc kill - orc weapons, your blood will spill.");
		}
		else {
			quest::say("Time to die $name!");
		}
	}
}

sub EVENT_DEATH_COMPLETE {
		if($NPCRace!=54){
			quest::say("My comrades will avenge my death.");
		}
}