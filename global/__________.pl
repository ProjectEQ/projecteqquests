# Gustave
# items: 85064, 85068, 85065, 85063, 85066, 85067

sub EVENT_SAY {
	if(quest::istaskactivityactive(222,9)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("Perhaps next time I'll pretend to be a tree! You need to find my brother, Napoleon next.");
			quest::updatetaskactivity(222,9);
			if($qglobals{halloween_ratter_complete} < 9){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",9,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 8){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 9 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",9,5,"D30");
			}
			if(qglobals{halloween_ratter_complete_pvp} > 8 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			my $newzone_gustave = plugin::GetRandomFreeLocation(0,40);
			quest::targlobal("halloween_ratter_gustave",$newzone_gustave,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}

sub EVENT_SPAWN {
	my $newrace = plugin::GetRandomApperance("$zonesn");
	my $newgender = plugin::FindBestGender($newrace);
	my $newsize = plugin::FindBestSize($newrace);
	quest::npcrace($newrace);
	quest::npcsize($newsize);
	quest::npcgender($newgender);
}
