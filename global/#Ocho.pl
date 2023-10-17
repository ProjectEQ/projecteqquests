# items: 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,6)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("Here, let me fix your tracking device for you.");
			quest::emote("takes device and repairs it, hands it back to you. 'You want my boss Toby next.'");
			quest::updatetaskactivity(500222,6);
			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} < 6){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),5); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",6,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} > 5){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} < 6 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),5); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",6,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} > 5 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			my $newzone_ocho = plugin::GetRandomFreeLocation(0,30);
			quest::targlobal("halloween_ratter_ocho",$newzone_ocho,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}
