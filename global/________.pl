# Sherlock
# items: 85064, 85068, 85065, 85063, 85066, 85067

sub EVENT_SAY {
	if(quest::istaskactivityactive(222,5)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("I had hoped my size would trick you. You need to find Ocho next!");
			quest::updatetaskactivity(222,5);
			if($qglobals{halloween_ratter_complete} < 5){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),5); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",5,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 4){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 5 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),5); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",5,5,"D30");
			}
			if(qglobals{halloween_ratter_complete_pvp} > 4 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}					
			my $newzone_sherlock = plugin::GetRandomFreeLocation(0,30);
			quest::targlobal("halloween_ratter_sherlock",$newzone_sherlock,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}