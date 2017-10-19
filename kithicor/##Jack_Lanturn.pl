# Jack_Lan'Turn
# Main trigger npc
# Buff lvl 1-30 with Valor

sub EVENT_SPAWN {
	quest::settimer(2,1800); # spawn
}

sub EVENT_SAY {
	$pcgm = $client->GetGM();
	if($text=~/reset/i && $pcgm == 1){
		quest::debug($client->GetCleanName() . " reset the great pumpkin, eta 30 sec");
		quest::settimer(2,30);
		quest::depopall(20266);
		quest::depopall(20267);
		quest::depopall(20257);
		quest::depopall(20269);
		quest::depopall(20268);
		quest::depopall(20256);
		quest::depopall(20265);
		quest::depopall(20264);
		quest::depopall(20255);
		quest::depopall(20272);
		quest::depopall(20273);
		quest::depopall(20261);
		quest::depopall(20270);
		quest::depopall(20271);
		quest::depopall(20258);
		quest::depopall(20274);
		quest::depopall(20262);
	} 
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Are you here to help us? We received word that an undead army is planning an attack on Freeport, and we are here to hold them off. If you need any [" . quest::saylink("defensive magics") . "] cast on you, do not hesitate to ask.");
	}	
	if ($text=~/defensive/i) {
		quest::say("For those of you new to Norrath, I can improve your [" . quest::saylink("valor") . "]. For those who have lasted more than 30 seasons, Tricksy can protect you with aegolism. For the rest of you, Eve can bestow upon you a greater virtue");
	}	
	if ($text=~/valor/i) {
		$npc->CastSpell($userid,312);
	}
}

sub EVENT_TIMER {	
	if ($timer == 2) { 
		quest::stoptimer(2);
		quest::shout("Here they come!");
		quest::depopall(20266);
		quest::depopall(20267);
		quest::depopall(20257);
		quest::depopall(20269);
		quest::depopall(20268);
		quest::depopall(20256);
		quest::depopall(20265);
		quest::depopall(20264);
		quest::depopall(20255);
		quest::depopall(20272);
		quest::depopall(20273);
		quest::depopall(20261);
		quest::depopall(20270);
		quest::depopall(20271);
		quest::depopall(20258);
		quest::depopall(20274);
		quest::depopall(20262);		
		quest::spawn2(20266,0,0,-151,976,7.5,215);
		quest::spawn2(20266,0,0,-161,976,7.5,215);
		quest::spawn2(20266,0,0,-131,976,7.5,215);
		quest::spawn2(20266,0,0,-121,976,7.5,215);
		quest::spawn2(20267,0,0,-151,986,7.5,215);
		quest::spawn2(20267,0,0,-161,986,7.5,215);
		quest::spawn2(20267,0,0,-131,986,7.5,215);
		quest::spawn2(20267,0,0,-121,986,7.5,215);
		quest::spawn2(20257,0,0,-141,976,7.5,215); #Casper
	}
	if ($timer == 3) {
		quest::stoptimer(3);
		quest::spawn2(20269,0,0,-243,1500,-14,189.6);
		quest::spawn2(20269,0,0,-233,1500,-14,189.6);
		quest::spawn2(20269,0,0,-263,1500,-14,189.6);
		quest::spawn2(20269,0,0,-273,1500,-14,189.6);
		quest::spawn2(20268,0,0,-243,1510,-14,189.6);
		quest::spawn2(20268,0,0,-233,1510,-14,189.6);
		quest::spawn2(20268,0,0,-263,1510,-14,189.6);
		quest::spawn2(20268,0,0,-273,1510,-14,189.6);
		quest::spawn2(20256,0,0,-233,1500,-14,189.6); #Captain_Scareyface
	}
	if ($timer == 4) {
		quest::stoptimer(4);
		quest::spawn2(20265,0,0,-151,976,7.5,215);
		quest::spawn2(20265,0,0,-161,976,7.5,215);
		quest::spawn2(20265,0,0,-131,976,7.5,215);
		quest::spawn2(20265,0,0,-121,976,7.5,215);
		quest::spawn2(20264,0,0,-151,986,7.5,215);
		quest::spawn2(20264,0,0,-161,986,7.5,215);
		quest::spawn2(20264,0,0,-131,986,7.5,215);
		quest::spawn2(20264,0,0,-121,986,7.5,215);	
		quest::spawn2(20255,0,0,-141,976,7.5,215); #Booberella
	}
	if ($timer == 5) {
		quest::stoptimer(5);
		quest::spawn2(20272,0,0,-151,976,7.5,215);
		quest::spawn2(20272,0,0,-161,976,7.5,215);
		quest::spawn2(20272,0,0,-131,976,7.5,215);
		quest::spawn2(20272,0,0,-121,976,7.5,215);
		quest::spawn2(20273,0,0,-151,986,7.5,215);
		quest::spawn2(20273,0,0,-161,986,7.5,215);
		quest::spawn2(20273,0,0,-131,986,7.5,215);
		quest::spawn2(20273,0,0,-121,986,7.5,215);
		quest::spawn2(20261,0,0,-141,976,7.5,215); #Solomon_Grundy
	}
	if ($timer == 6) {
		quest::stoptimer(6);
		quest::spawn2(20270,0,0,-243,1500,-14,189.6);
		quest::spawn2(20270,0,0,-233,1500,-14,189.6);
		quest::spawn2(20270,0,0,-263,1500,-14,189.6);
		quest::spawn2(20270,0,0,-273,1500,-14,189.6);
		quest::spawn2(20271,0,0,-243,1510,-14,189.6);
		quest::spawn2(20271,0,0,-233,1510,-14,189.6);
		quest::spawn2(20271,0,0,-263,1510,-14,189.6);
		quest::spawn2(20271,0,0,-273,1510,-14,189.6);
		quest::spawn2(20258,0,0,-233,1500,-14,189.6); #Count_Alucard
	}
	if ($timer == 7) {
		quest::stoptimer(7);
		quest::spawn2(20274,0,0,-243,1500,-14,189.6);
		quest::spawn2(20274,0,0,-233,1500,-14,189.6);
		quest::spawn2(20274,0,0,-263,1500,-14,189.6);
		quest::spawn2(20274,0,0,-273,1500,-14,189.6);
		quest::spawn2(20274,0,0,-243,1510,-14,189.6);
		quest::spawn2(20274,0,0,-233,1510,-14,189.6);
		quest::spawn2(20274,0,0,-263,1510,-14,189.6);
		quest::spawn2(20274,0,0,-273,1510,-14,189.6);
		quest::spawn2(20262,0,0,-233,1500,-14,189.6); #The_Great_Pumpkin
	}
	if ($timer == 8) {
		quest::stoptimer(8);
        quest::shout("The forces will be coming in about an hour's time!");
	}
}

sub EVENT_SIGNAL {
	if($signal == 1){
		quest::settimer(3, 300); # 5 min before wave 2
	}	
	if($signal == 2){
		quest::settimer(4, 300); # 5 min before wave 3
	}	
	if($signal == 3){
		quest::settimer(5, 300); # 5 min before wave 4
	}
	if($signal == 4){
		quest::settimer(6, 300); # 5 min before wave 5
	}	
	if($signal == 5){
		quest::settimer(7, 300); # 5 min before wave 6
	}	
	if($signal == 6){
		quest::shout("We did it! Freeport is safe! Happy Halloween!");
     	my $random = int(rand(2700));
      	my $randomspawn = $random + 3600;
		quest::debug($randomspawn . " seconds until next pumpkin");
		quest::settimer(2, $randomspawn); # 1-1:45 hours until event starts
		quest::settimer(8, $random); # announce forces coming in an hour
		quest::setglobal("halloween_great_pumpkin",1,7,"S$randomspawn"); #for debug purposes only
	}		
}