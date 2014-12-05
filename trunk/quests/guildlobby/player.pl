my $Pet_ENT;

sub EVENT_CLICKDOOR {
	if($doorid == 2 || $doorid == 4 || $doorid == 40 || $doorid == 42) {
		if($uguild_id > 0) {
			if (defined($qglobals{"ginstance$uguild_id"})) {
				$guildinstance = $qglobals{"ginstance$uguild_id"};
				quest::AssignToInstance($guildinstance);
				quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34);
			} else {
				$guildinstance = quest::CreateInstance("guildhall", 1, 86400);
				quest::AssignToInstance($guildinstance); 
				quest::setglobal("ginstance$uguild_id",$guildinstance,7,"H25");
				quest::MovePCInstance(345, $guildinstance, -1.00, -1.00, 3.34)
			}
		}
  	} elsif((($doorid >= 5) && ($doorid <= 38)) ||  (($doorid >= 43) && ($doorid <= 76))) {
		$client->OpenLFGuildWindow();
  	}
}

sub EVENT_ENTERZONE {

	#off the map
	if ($client->GetX() > 315 || $client->GetX() < -315 || $client->GetY() > 685 || $client->GetY() < -60 || $client->GetZ() < -5 || $client->GetZ() > 15) {
		$client->MovePC(344, 0, 312, 2, 0);
	}

	#if I am idle for more than xx seconds, auto-afk and go invisible/don't draw model
	quest::settimer("afk_check", 1200); #20 minutes
	
	if(($client->GetClientVersionBit() & 4294967264)!= 0) {
		if($client->GetInstanceID() != 5) {
			quest::settimer(1,10);
			$client->Message(0,"Invalid Zone(344:0): You will be redirected to the proper instance in 10 seconds.");
		}
	} else {
		if($client->GetInstanceID() == 5) {
			quest::settimer(2,10);
			$client->Message(0,"Invalid Zone(344:5): You will be redirected to the proper zone in 10 seconds.");
		}
	}
}

sub EVENT_SIGNAL {
	#signals received from enter/exit proximity of various NPCs
	if ($client->GetRace() != 127) {
		#I am not invisible from auto-afk, and I'm still moving around, reset auto-afk timer
		quest::settimer("afk_check", 1200);
	} else {
		#I was already set invisible from auto-afk, but now I am moving, set back to base race - not afk
		$client->SetRace($client->GetBaseRace());
		$client->SetGender($client->GetBaseGender());
		if ($client->GetPetID()) {
			$Pet_ENT = $entity_list->GetMobByID($client->GetPetID());
			$Pet_ENT->SetRace($Pet_ENT->GetBaseRace());
		}
		$client->Message(4, "You are no longer idle.");
		quest::settimer("afk_check", 1200);
	}	
}
	
sub EVENT_TIMER {
	if($timer == 1) {
		quest::MovePCInstance(344,5,$x,$y,$z,225);
	} elsif($timer == 2) {
		quest::movepc(344,$x,$y,$z,225);
	} elsif($timer eq "afk_check") {
		#I have been idle, go auto-afk and don't draw model
		$client->Message(4, "You are idle, Auto-AFK");
		if ($client->GetPetID()) {
			$Pet_ENT = $entity_list->GetMobByID($client->GetPetID());
			$Pet_ENT->SetRace(127);
		}
		$client->SetRace(127);
		$client->SetGender(0);
		quest::stoptimer("afk_check");
	}
}