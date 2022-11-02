# items: 111901, 124688
sub EVENT_SAY {
	if($text=~/interested/i) { 
		quest::say("Great! Take this tool. It'll help you track down your targets. Be warned, however! Your tool is not protected from sabatoge, and does not work well if your target roams about, instead of staying in a single spot. My boys know this, and will take advantage! If you have trouble finding a particular target, Icarus may be able to help. Let me know when you are [" . quest::saylink("ready") . "].");
		quest::summonitem(111901); # Item: Wand of Metacrystalline Teleportation
	}
	if(!quest::istaskactive(500222)){
		if($text=~/Hail/i) {
			quest::say("Greetings! I am the eldest member of the Rattus faction Norvegicus. Standing next to me is our youngest member my apprentice Icarus. Once a year, the three clans get together to test their survival skills. For the first time ever, outsiders have been invitied to join in the [" . quest::saylink("hunt") . "]!");
		}
		if($text=~/Hunt/i) {
			quest::say("Norvegicus test their skills by hiding randomly in the world allowing their comrades to hunt them. This year, all members have hidden themselves save myself and Icarus. If you are [" . quest::saylink("interested") . "] in participating, I can sign you up and send you off on the hunt.");
		}
		if($text=~/ready/i){
			quest::say("You are signed up! Also! You are not just competing with Rattus, other hunters will be searching for the same targets as you. To make things more interesting and to double your rewards, I can make you a hunter killer [" . quest::saylink("PVP on") . "]. I can also return you to normal after one of your hours [" . quest::saylink("PVP off") . "]. Your first target is Kai! Good luck!");
			quest::assigntask(500219);
			quest::assigntask(500222);
		}
	}
	else {
	$pcpvp = $client->GetPVP();
	$pcgm = $client->GetGM();
		if($text=~/Report/i && $pcgm == 1){
			my $location_k = plugin::GetRatLocation("halloween_ratter_kai");
			my $location_b = plugin::GetRatLocation("halloween_ratter_brutus");
			my $location_a = plugin::GetRatLocation("halloween_ratter_aristotle");
			my $location_z = plugin::GetRatLocation("halloween_ratter_zeus");
			my $location_s = plugin::GetRatLocation("halloween_ratter_sherlock");
			my $location_o = plugin::GetRatLocation("halloween_ratter_ocho");
			my $location_t = plugin::GetRatLocation("halloween_ratter_toby");
			my $location_g = plugin::GetRatLocation("halloween_ratter_gustave");
			my $location_n = plugin::GetRatLocation("halloween_ratter_napoleon");
			my $location_sp = plugin::GetRatLocation("halloween_ratter_sprocket");
			my $location_m = plugin::GetRatLocation("halloween_ratter_mortimer");
			my $location_p = plugin::GetRatLocation("halloween_ratter_paulie");
			$zsn_k = plugin::Get_rat_zonesn($location_k);
			$zsn_b = plugin::Get_rat_zonesn($location_b);
			$zsn_a = plugin::Get_rat_zonesn($location_a);
			$zsn_z = plugin::Get_rat_zonesn($location_z);
			$zsn_s = plugin::Get_rat_zonesn($location_s);
			$zsn_o = plugin::Get_rat_zonesn($location_o);
			$zsn_t = plugin::Get_rat_zonesn($location_t);
			$zsn_g = plugin::Get_rat_zonesn($location_g);
			$zsn_n = plugin::Get_rat_zonesn($location_n);
			$zsn_sp = plugin::Get_rat_zonesn($location_sp);
			$zsn_m = plugin::Get_rat_zonesn($location_m);
			$zsn_p = plugin::Get_rat_zonesn($location_p);
			$client->Message(0, "Kai is in " . quest::GetZoneLongName($zsn_k) . ".");
			$client->Message(0, "Brutus is in " . quest::GetZoneLongName($zsn_b) . ".");
			$client->Message(0, "Aristotle is in " . quest::GetZoneLongName($zsn_a) . ".");
			$client->Message(0, "Zeus is in " . quest::GetZoneLongName($zsn_z) . ".");
			$client->Message(0, "Sherlock is in " . quest::GetZoneLongName($zsn_s) . ".");
			$client->Message(0, "Ocho is in " . quest::GetZoneLongName($zsn_o) . ".");
			$client->Message(0, "Toby is in " . quest::GetZoneLongName($zsn_t) . ".");
			$client->Message(0, "Gustave is in " . quest::GetZoneLongName($zsn_g) . ".");
			$client->Message(0, "Napoleon is in " . quest::GetZoneLongName($zsn_n) . ".");
			$client->Message(0, "Sprocket is in " . quest::GetZoneLongName($zsn_sp) . ".");
			$client->Message(0, "Mortimer is in " . quest::GetZoneLongName($zsn_m) . ".");
			$client->Message(0, "Paulie is in " . quest::GetZoneLongName($zsn_p) . ".");
		}
		if($text=~/Hail/i && quest::istaskactivityactive(500222,4)) {
			quest::say("Great job! Your next target is Sherlock.");
			quest::updatetaskactivity(500222,4);
			if($qglobals{halloween_ratter_complete} < 4){
				quest::summonitem(
					quest::ChooseRandom(
						37538, # Stat Drink
						48083, # XP Bottle 1
						48084, # XP Bottle 2
						48085, # XP Bottle 3
						29781 # Party Platter
					)
				);
				$client->Message(3, "You have been awarded a special item!"); 
					
				quest::setglobal("halloween_ratter_complete",4,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 3){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 4 && $pcpvp == 1){
				if(defined $qglobals{halloween_pvp_zeus}){ 
					quest::summonitem(
						quest::ChooseRandom(
							37538, # Stat Drink
							48083, # XP Bottle 1
							48084, # XP Bottle 2
							48085, # XP Bottle 3
							29781 # Party Platter
						)
					);
					$client->Message(3, "You have been awarded a special item!"); 
					
					quest::setglobal("halloween_ratter_complete_pvp",4,5,"D30");
				}
				else {
					$client->Message(0, "I'm sorry, you do not qualify for the PVP reward as you did not defeat the previous boss with your PVP flag on."); 
				}
			}
			if($qglobals{halloween_ratter_complete_pvp} > 3 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
		}
		if($text=~/Hail/i && quest::istaskactivityactive(500222,8)) {
			quest::say("Great job! Your next target is Gustave.");
			quest::updatetaskactivity(500222,8);
			if($qglobals{halloween_ratter_complete} < 8){
				quest::summonitem(
					quest::ChooseRandom(
						37538, # Stat Drink
						48083, # XP Bottle 1
						48084, # XP Bottle 2
						48085, # XP Bottle 3
						29781 # Party Platter
					)
				);
				$client->Message(3, "You have been awarded a special item!"); 
				
				quest::setglobal("halloween_ratter_complete",8,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 7){
				$client->Message(0, "You have already claimed a reward for this activity or a higher and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 8 && $pcpvp == 1){
				if(defined $qglobals{halloween_pvp_toby}){ 
					quest::summonitem(
						quest::ChooseRandom(
							37538, # Stat Drink
							48083, # XP Bottle 1
							48084, # XP Bottle 2
							48085, # XP Bottle 3
							29781 # Party Platter
						)
					);
					$client->Message(3, "You have been awarded a special item!"); 
					
					quest::setglobal("halloween_ratter_complete_pvp",8,5,"D30");
				}
				else {
					$client->Message(0, "I'm sorry, you do not qualify for the PVP reward as you did not defeat the previous boss with your PVP flag on."); 
				}
			}
			if($qglobals{halloween_ratter_complete_pvp} > 7 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity or a higher and do not qualify for another.");
			}
		}
		if($text=~/Hail/i && quest::istaskactivityactive(500222,14)) {
			quest::say("Great job! You did it! Here take this as your prize! Hand it in to Dieffer over there for a special item!");
			quest::updatetaskactivity(500222,14);
			if($qglobals{halloween_ratter_complete} < 14){
				quest::summonitem(
					quest::ChooseRandom(
						37538, # Stat Drink
						48083, # XP Bottle 1
						48084, # XP Bottle 2
						48085, # XP Bottle 3
						29781 # Party Platter
					)
				);
				$client->Message(3, "You have been awarded a special item!"); 
				quest::summonitem(124688); # Item: Peace Be With You
				quest::enabletitle(6);
				plugin::Whisper("You have been awarded a new title!");
				quest::setglobal("halloween_ratter_complete",14,5,"D30");
			}
			if($qglobals{halloween_ratter_complete} > 13){
				$client->Message(0, "You have already claimed a reward for this activity and do not qualify for another.");
			}
			if($qglobals{halloween_ratter_complete_pvp} < 14 && $pcpvp == 1){
				if(defined $qglobals{halloween_pvp_paulie}){ 
					quest::summonitem(
						quest::ChooseRandom(
							37538, # Stat Drink
							48083, # XP Bottle 1
							48084, # XP Bottle 2
							48085, # XP Bottle 3
							29781 # Party Platter
						)
					);
					$client->Message(3, "You have been awarded a special item!"); 
					quest::setglobal("halloween_ratter_complete_pvp",14,5,"D30");
				}
				else {
					$client->Message(0, "I'm sorry, you do not qualify for the PVP reward as you did not defeat the previous boss with your PVP flag on.");
				}	
			}
			if($qglobals{halloween_ratter_complete_pvp} > 13 && $pcpvp == 1){
				$client->Message(0, "You have already claimed a PVP reward for this activity and do not qualify for another.");
			}
		}		
		if($text=~/pvp on/i && $pcpvp == 1) {
			quest::say("You are already a hunter killer!");
		}
		elsif($text=~/pvp on/i && !defined $qglobals{halloween_ratter_pvp}) {
			quest::pvp(on);
			quest::setglobal("halloween_ratter_pvp",1,5,"H1");
			quest::say("Done.");
		}
		if($text=~/pvp off/i && !defined $qglobals{halloween_ratter_pvp}) {
			quest::pvp(off);
			quest::setglobal("halloween_ratter_pvp",1,5,"H1");
			quest::say("Done.");
		}
		if(($text=~/pvp off/i || $text=~/pvp off/i) && defined $qglobals{halloween_ratter_pvp}) {
			quest::say("I'm sorry, you must wait more time before I can do that.");
		}
		elsif(quest::istaskactivityactive(500222,0)) {
			quest::say("What are you waiting for? Go out there and find Kai!");
		}
		elsif(quest::istaskactivityactive(500222,1)) {
			quest::say("What are you waiting for? Go out there and find Brutus!");
		}
		elsif(quest::istaskactivityactive(500222,2)) {
			quest::say("What are you waiting for? Go out there and find Aristotle!");
		}
		elsif(quest::istaskactivityactive(500222,3)) {
			quest::say("What are you waiting for? Go out there and find Zeus!");
		}
		elsif(quest::istaskactivityactive(500222,5)) {
			quest::say("What are you waiting for? Go out there and find Sherlock!");
		}
		elsif(quest::istaskactivityactive(500222,6)) {
			quest::say("What are you waiting for? Go out there and find Ocho!");
		}
		elsif(quest::istaskactivityactive(500222,7)) {
			quest::say("What are you waiting for? Go out there and find Toby!");
		}
		elsif(quest::istaskactivityactive(500222,9)) {
			quest::say("What are you waiting for? Go out there and find Gustave!");
		}
		elsif(quest::istaskactivityactive(500222,10)) {
			quest::say("What are you waiting for? Go out there and find Napoleon!");
		}
		elsif(quest::istaskactivityactive(500222,11)) {
			quest::say("What are you waiting for? Go out there and find Sprocket!");
		}
		elsif(quest::istaskactivityactive(500222,12)) {
			quest::say("What are you waiting for? Go out there and find Mortimer!");
		}
		elsif(quest::istaskactivityactive(500222,13)) {
			quest::say("What are you waiting for? Go out there and find Paulie!");
		}
	}
}