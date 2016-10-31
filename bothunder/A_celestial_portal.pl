 # NPCID: Bastion of Thunder >> A_celestial_portal (209036) 
 sub EVENT_SIGNAL { 
 	#signals from Emmerik_Skyfury (209053) 
 	if($signal == 1) { 
 		#timer to spawn adds every 120 seconds 
 		quest::settimer("celestial_portal_adds",120); 
 	} elsif($signal == 2) { 
 		#stop making adds 
 		quest::stoptimer("celestial_portal_adds"); 
 	} 
 } 
 
 sub EVENT_TIMER { 
 	if($timer == "celestial_portal_adds") { 
 		#spawn #An_animated_meteor
 		quest::spawn2(209116,0,0,$x,$y,$z,$h);  
 	}  
 } 
