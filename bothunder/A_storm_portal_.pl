# NPCID: Bastion of Thunder >> A_storm_portal_ (209034)
sub EVENT_SIGNAL {
	#signals from Emmerik_Skyfury (209053)
	if($signal == 1) {
		#timer to spawn adds every 30 seconds
		quest::settimer("storm_portal_adds",30);
	} elsif($signal == 2) {
		#stop making adds
		quest::stoptimer("storm_portal_adds");
	}
}

sub EVENT_TIMER {
	if($timer eq "storm_portal_adds") {
		#spawn #A_storm_guardian
		quest::spawn2(209103,0,0,$x,$y,$z,$h); 
	} 
}
