# NPCID: Bastion of Thunder >> A_firestorm_portal (209038)
sub EVENT_SIGNAL {
	#signals from Evynd_Firestorm (209054)
	if($signal == 1) {
		#timer to spawn adds every 30 seconds
		quest::settimer("firestorm_portal_adds",30);
	} elsif($signal == 2) {
		#stop making adds
		quest::stoptimer("firestorm_portal_adds"); #stop spawning
	}
}

sub EVENT_TIMER {
	if($timer == "firestorm_portal_adds") {
		#spawn A_storm_guardian_
		quest::spawn2(209037,0,0,$x,$y,$z,$h);
	}
}
