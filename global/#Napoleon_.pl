# items: 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SPAWN {
	quest::say("Alright already!");
	quest::settimer(1,300);
}	

sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,10)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
			my $npcid = 999100;

			quest::say("Sprocket is your next target.");
			quest::updatetaskactivity(500222,10);
			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} < 10){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",10,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} > 9){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} < 10 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),10); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",10,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} > 9 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
			quest::targlobal("halloween_ratter_napoleon",$newzone_napoleon,"F",0,0,0);
			quest::signalwith($npcid,2);
			quest::delglobal("halloween_lock_napoleon");
			quest::depop();
		}
	}
}

sub EVENT_TIMER {
	quest::stoptimer(1);
	my $newzone_napoleon = plugin::GetRandomFreeLocation(0,40);
	my $npcid = 999100;
	quest::signalwith($npcid,2);
	quest::targlobal("halloween_ratter_napoleon",$newzone_napoleon,"F",0,0,0);
	quest::delglobal("halloween_lock_napoleon");
	quest::depop();
}