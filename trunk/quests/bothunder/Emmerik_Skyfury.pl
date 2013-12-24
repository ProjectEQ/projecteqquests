#NPCID: Bastion of Thunder > Emmerik_Skyfury (209053)
sub EVENT_AGGRO {
	#tell A_storm_portal_ I have engaged
	quest::signalwith(209034,1,1);
	# create a timer to check if I have lost all aggro and need to reset the event
	quest::settimer("emmerik_aggro_check",60);
}

sub EVENT_DEATH_COMPLETE {
	#spawn #Askr_the_Lost_ to port players to the next floor
	quest::spawn2(209102,0,0,$x,$y,$z,$h); 
	#tell the A_storm_portal_ I have died
	quest::signalwith(209034,2,1); 
}

sub EVENT_TIMER {
	if ($timer == "emmerik_aggro_check") {
		if(!$npc->IsEngaged()) {
			# if I have no aggro stop the portals from spawning adds
			quest::signalwith(209034,2,1); 
			#depop the portal adds
			quest::depopall(209103);
			quest::stoptimer("emmerik_aggro_check");
		}
	}
}