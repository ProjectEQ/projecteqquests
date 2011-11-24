sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Dead men tell no tales!!");
	}
	if($combat_state==0) {
		quest::say("Aye!!  There be no quarter among the Pirates of Gunthak!");
	}
}

sub EVENT_DEATH {
	quest::say("You have run me through!  Beware the Pirates of Gunthak.. They will avenge me. . . Unngh!!");
}