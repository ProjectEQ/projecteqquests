# NPCID: Bastion of Thunder >> A_firestorm_portal (209038)
sub EVENT_SIGNAL {
	#signals from Evynd_Firestorm (209054)
	if($signal == 1) {
		#timer to spawn adds every 120 seconds
		quest::settimer("firestorm_portal_adds",120);
	} elsif($signal == 2) {
		#stop making adds
		quest::stoptimer("firestorm_portal_adds"); #stop spawning
	}
}

sub EVENT_TIMER {
	if($timer eq "firestorm_portal_adds") {
		#spawn A_firestorm_elemental_
		quest::spawn2(209118,0,0,$x,$y,$z,$h);
	}
}
