# NPCID: Bastion of Thunder >> Evynd_Firestorm (209054)
sub EVENT_AGGRO {
	# tell the A_firestorm_portal I have engaged
	quest::signalwith(209038,1,1);
	# create a timer to check if I have lost all aggro and need to reset the event
	quest::settimer("evynd_aggro_check",60);
}

sub EVENT_DEATH_COMPLETE {
	# spawn #Askr_the_Lost to port players to the next floor
	quest::spawn2(209101,0,0,$x,$y,$z,$h);
	# tell the A_firestorm_portal I have died
	quest::signalwith(209038,2,1);
}

sub EVENT_TIMER {
	if ($timer eq "evynd_aggro_check") {
		if(!$npc->IsEngaged()) {
			# if I have no aggro stop the portals from spawning adds
			quest::signalwith(209038,2,1);
			#depop the firestorm portal adds.
			quest::depopall(209118);
			quest::stoptimer("evynd_aggro_check");
		}
	}
}
		
