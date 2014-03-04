# #High_Priest_Nkosi_Bakari (297218)

sub EVENT_COMBAT {
	if($combat_state == 1) {
		quest::signalwith(297212,2); #let trigger know I'm engaged
	} else {
		quest::signalwith(297212,4);
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(297212,5);
}