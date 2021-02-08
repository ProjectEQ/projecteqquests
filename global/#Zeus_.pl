# items: 85062, 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SPAWN {
	quest::say("Enough! You are a worthy warrior.");
	quest::settimer(1,300);
}	

sub EVENT_SAY {
	if(quest::istaskactivityactive(222,3)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
			my $npcid = 999100;

			quest::say("You should go speak with Roosevelt again next.");
			quest::updatetaskactivity(222,3);
			if($qglobals{halloween_ratter_complete} < 3){
				quest::summonitem(85062); # Item: Bristlebane's Ticket of Admission
				quest::setglobal("halloween_ratter_complete",3,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 2){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 3 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),5); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_pvp_zeus",1,5,"D30");
				quest::setglobal("halloween_ratter_complete_pvp",3,5,"D30");
			}
			if(qglobals{halloween_ratter_complete_pvp} > 2 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}	
			quest::targlobal("halloween_ratter_zeus",$newzone_zeus,"F",0,0,0);
			quest::signalwith($npcid,2);
			quest::delglobal("halloween_lock_zeus");
			quest::depop();
		}
	}
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	my $newzone_zeus = plugin::GetRandomFreeLocation(0,20);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_zeus",$newzone_zeus,"F",0,0,0);
	quest::delglobal("halloween_lock_zeus");
	quest::depop();
}