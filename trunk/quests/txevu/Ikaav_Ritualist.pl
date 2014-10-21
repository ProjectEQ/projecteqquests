#  Ikaav_Ritualist (297147)

sub EVENT_SIGNAL {
	#ZMTZ lost aggro
	quest::settimer("wipe_agro", 5);
}

sub EVENT_TIMER {
	$npc->WipeHateList();
	quest::stoptimer("wipe_agro");
}

sub EVENT_DEATH_COMPLETE {
	#tell ZMTZ I died, spawn adds slower
	quest::signalwith(297150, 297147);
}