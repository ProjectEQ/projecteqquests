# items: 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,11)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("Hahaha your tracking device should work again now! You want to find my brother, Mortimer next.");
			quest::updatetaskactivity(500222,11);
			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} < 11){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",11,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} > 10){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} < 11 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",11,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} > 10 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			my $newzone_sprocket = plugin::GetRandomFreeLocation(0,40);
			quest::targlobal("halloween_ratter_sprocket",$newzone_sprocket,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}