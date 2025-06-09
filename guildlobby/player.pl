my $Pet_ENT;

sub EVENT_CLICKDOOR {
	if($doorid == 2 || $doorid == 4 || $doorid == 40 || $doorid == 42) {
		if($uguild_id > 0) {
			$client->SendToGuildHall();
		}
  	} elsif((($doorid >= 5) && ($doorid <= 38)) ||  (($doorid >= 43) && ($doorid <= 76))) {
		$client->OpenLFGuildWindow();
  	}
}

sub EVENT_ENTERZONE {
	#off the map
	if ($client->GetX() > 315 || $client->GetX() < -315 || $client->GetY() > 685 || $client->GetY() < -60 || $client->GetZ() < -5 || $client->GetZ() > 15) {
		$client->MovePC(344, 0, 312, 2, 0); # Zone: guildlobby
	}
}

sub EVENT_SIGNAL {
	#signals received from enter/exit proximity of various NPCs
	#if ($client->GetRace() != 127) {
		#I am not invisible from auto-afk, and I'm still moving around, reset auto-afk timer
		#quest::settimer("afk_check", 1200);
	#} else {
		#I was already set invisible from auto-afk, but now I am moving, set back to base race - not afk
		#$client->SetRace($client->GetBaseRace());
		#$client->SetGender($client->GetBaseGender());
		#if ($client->GetPetID()) {
		#	$Pet_ENT = $entity_list->GetMobByID($client->GetPetID());
		#	$Pet_ENT->SetRace($Pet_ENT->GetBaseRace());
		#}
		#$client->Message(4, "You are no longer idle.");
		#quest::settimer("afk_check", 1200);
	#}
}

sub EVENT_TIMER {
	if($timer == 1) {
		quest::MovePCInstance(344,5,$x,$y,$z,450); # Zone: guildlobby
	} elsif($timer == 2) {
		quest::movepc(344,$x,$y,$z,225); # Zone: guildlobby
	}
}
