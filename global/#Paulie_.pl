# items: 85062, 124688
sub EVENT_SPAWN {
	quest::say("*Huff Huff* Okay, I'm done.");
	quest::settimer(1,300);
}	

sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,13)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			my $newzone_paulie = plugin::GetRandomIndoorLocation(1,40);
			my $npcid = 999100;

			quest::say("I can't believe you beat me! You should see Roosevelt now.");
			quest::updatetaskactivity(500222,13);
			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} < 13){
				quest::summonitem(85062); # Item: Bristlebane's Ticket of Admission
				quest::setglobal("halloween_ratter_complete",13,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} > 12){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} < 13 && $pcpvp == 1){
				quest::summonitem(124688); # Item: Peace Be With You
				quest::setglobal("halloween_pvp_paulie",1,5,"D30");
				quest::setglobal("halloween_ratter_complete_pvp",13,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} > 12 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			quest::targlobal("halloween_ratter_paulie",$newzone_paulie,"F",0,0,0);
			quest::signalwith($npcid,2);
			quest::delglobal("halloween_lock_paulie");
			quest::depop();
		}
	}
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	my $newzone_paulie = plugin::GetRandomIndoorLocation(1,40);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_paulie",$newzone_paulie,"F",0,0,0);
	quest::delglobal("halloween_lock_paulie");
	quest::depop();
}