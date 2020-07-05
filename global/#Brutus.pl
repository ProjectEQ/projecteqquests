# items: 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SAY {
	if(quest::istaskactivityactive(222,1)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("Bah, I knew I should have gone somewhere else. You want to find Aristotle next.");
			quest::updatetaskactivity(222,1);
			if($qglobals{halloween_ratter_complete} < 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),1); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",1,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 0){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 1 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),1); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",1,5,"D30");
			}
			if(qglobals{halloween_ratter_complete_pvp} > 0 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			my $newzone_brutus = plugin::GetRandomFreeLocation(0,12);
			quest::targlobal("halloween_ratter_brutus",$newzone_brutus,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("bites your ear!");
	}
}