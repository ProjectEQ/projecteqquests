# items: 85064, 85068, 85065, 85063, 85066, 85067, 84091
sub EVENT_SAY {
	if($text=~/trick or treat/i){
		if(!defined $qglobals{halloween_candy}){
			$gender = $client->GetGender();
			$basegender = $client->GetBaseGender();
			$race = $client->GetRace();
			$baserace = $client->GetBaseRace();
			if(($gender != $basegender) || ($race != $baserace)){
				quest::say("It's nice to see you dressed up! Happy Halloween!");
				quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067,84091)); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067), Sand (84091)
				quest::setglobal("halloween_candy",1,0,"D30");
			}
		}
		else {
			quest::say("I already gave you candy!");
		}
	}
}
	