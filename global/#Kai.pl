# items: 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,0)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("You got me! Your next target is Brutus.");
			quest::updatetaskactivity(500222,0);
			if(!defined $qglobals{halloween_ratter_complete}){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),1); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",0,5,"D30");
			}
			if(defined $qglobals{halloween_ratter_complete}){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if(!defined $qglobals{halloween_ratter_complete_pvp} && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),1); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",0,5,"D30");
			}
			if(defined $qglobals{halloween_ratter_complete_pvp} && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			my $newzone_kai = plugin::GetRandomFreeLocation(0,12);
			quest::targlobal("halloween_ratter_kai",$newzone_kai,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}