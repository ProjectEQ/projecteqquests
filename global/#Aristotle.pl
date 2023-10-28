# items: 85064, 85068, 85065, 85063, 85066, 85067
sub EVENT_SAY {
	if(quest::istaskactivityactive(500222,2)) {
		if($text=~/Hail/i) {
			$pcpvp = $client->GetPVP();
			quest::say("I thought you'd never find me! Next up is my clan's boss, Zeus.");
			quest::updatetaskactivity(500222,2);
			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} < 2){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),1); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete",2,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete}) && $qglobals{halloween_ratter_complete} > 1){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} < 2 && $pcpvp == 1){
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),1); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
				quest::setglobal("halloween_ratter_complete_pvp",2,5,"D30");
			}

			if(defined($qglobals{halloween_ratter_complete_pvp}) && $qglobals{halloween_ratter_complete_pvp} > 1 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}			
			my $newzone_aristotle = plugin::GetRandomIndoorLocation(1,20);
			quest::targlobal("halloween_ratter_aristotle",$newzone_aristotle,"F",0,0,0);
			quest::depop();
		}
	}
	else {
		quest::emote("stands on his hind legs and sniffs you. You are uninteresting to him.");
	}
}

sub EVENT_SPAWN {
my $min = 1;
my $range = 4;
my $randomspawn = int(rand($range)) + $min;
	plugin::RandomRoam(250, 250);
	quest::settimer(1,$randomspawn);
}
	
sub EVENT_TIMER {
	plugin::RandomRoam(250, 250);
}
