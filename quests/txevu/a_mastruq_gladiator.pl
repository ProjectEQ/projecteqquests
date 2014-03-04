# Arena Mob

sub EVENT_SPAWN { 
	quest::settimer(1,10);
}

sub EVENT_TIMER {
	#random melee animations
	quest::doanim(quest::ChooseRandom(1,2,5,6,8,84,85));
}

sub EVENT_SIGNAL {
	#aggro runt assist
	quest::stoptimer(1);
	quest::modifynpcstat("special_attacks","SMCD");
}

sub EVENT_COMBAT {
	if($combat_state == 0) {
		quest::modifynpcstat("special_attacks","ABfHG"); #go inactive
		quest::settimer(1,10);
	}
}