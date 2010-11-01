sub EVENT_SPAWN {
	quest::settimer(2,180);	  # 3 min between shouts
}

sub EVENT_SAY {
	if(quest::istaskactivityactive(216,10)){
		if($text=~/Hail/i) {
			if(defined $qglobals{halloween_race_victory} && !defined $qglobals{halloween_race_complete}) {
				quest::summonitem(80056);
				quest::summonitem(85062);
				$client->AddLevelBasedExp(10, 0);
				quest::setglobal("halloween_race_complete",1,0,"D30");
				quest::delglobal("halloween_race_victory");
				quest::say("Amazing! You rode swiftly and true... few could rival your speed! Take this cloak, and wear it to commemorate this day.");
				quest::updatetaskactivity(216,10);
			}
			elsif(defined $qglobals{"halloween_race_victory"} && defined $qglobals{halloween_race_complete}){
				quest::say("Amazing! You rode swiftly and true... few could rival your speed!");
				quest::updatetaskactivity(216,10);
			}
			else {
				quest::say("You managed to find your way through Nektulos to Neriak, but you did not as quickly as you could have... Let me know if you would like to [try] again.");
				quest::failtask(216);
			}
		}
				
	}
	elsif(quest::istaskactive(216)){
		if($text=~/Hail/i) {
      			quest::say("What are you waiting for? Get going!");
      		}
		if(!defined $qglobals{halloween_race_start}) {
			if($text=~/Ready/i) {
				quest::setglobal("halloween_race_start",1,1,"M4");
   				quest::say("Ride quickly and do not hesitate... Remember, you have only four minutes to reach the gates of Neriak.");
			}
		}
      	}
	elsif(!quest::istaskactive(216)){
		if($text=~/Hail/i) {
   			quest::emote("nods solemnly at you, 'Have you also come to stand [vigil] on this day of grim history?'");
      		}
      		if($text=~/Vigil/i) {
      			quest::emote("looks at your closely, 'Ah, I see you are not familiar with the vigil for Ritrim Shives, my ancestor who cheated the creatures that dwell below the forest roots and lived to tell the [tale].'");
		}
		if($text=~/Tale/i) {
   			quest::emote("smiles darkly, 'The Tale is a horrifying one... in exchange for the life of his only child, these creatures agreed to bestow upon Ritrim a dark and terrible [power].'");
      		}
		if($text=~/Power/i) {
   			quest::emote("nods, 'The power to harm any living creature with a mere touch of the hand.. After a gruesome ceremony, when he was granted the dark power, he acted quickly and used his new power to slay the creatures even as they prepared to sacrifice his child, and feast upon his flesh... in his haste to subvert the agreement, Ritrim failed to realized the [toll] that the power would take upon him.'");
      		}
		if($text=~/Toll/i) {
   			quest::emote("chuckles, 'Using his new power drained his energy, leaving him weak and vulnerable. With his son, he moved towards his mount, a powerful black warhorse, a single enemy blocked his path... Ritrim reached out again with his power, killing his foe, but not quickly enough... a shout was given, and he felt a searing pain as his [eyes] were burned away.'");
		}
		if($text=~/Eyes/i) {
   			quest::say("Blinded, and in great pain, Ritrim mounted his steed to make his escape, the voice of his son guiding him as he charged through the forest of Nektulos weaving a [crooked path] in order to evade his pursuers, and return to Neriak.");
		}
		if($text=~/Crooked/i) {
   			quest::emote("smiles, 'If you are really that interested, I will summon you a dark [mount] so that you may follow the path for yourself.'");
		}
		if($text=~/Mount/i || $text=~/Try/i) {
   			quest::emote("hands you a bridle, 'When you are [ready], you will need to ride with haste and reach the gates of Neriak before the fourth minute has passed.'");
			quest::assigntask(219);
      			quest::assigntask(216);
			quest::summonitem(80039);	
		}
	}	
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}    