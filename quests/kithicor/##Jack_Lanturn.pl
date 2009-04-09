# Jack_Lan'Turn
# Main trigger npc
# Buff lvl 1-30 with Valor

sub EVENT_SPAWN {
	quest::settimer(17,5);	# check for the global every 5sec
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, $name. Are you here to help us? We recieved word that an undead army is planning an attack on Freeport, and we are here to hold them off (at approx 9pm EST). If you need any [defensive magics] cast on you, do not hesitate to ask.");
	}
	
	if ($text=~/defensive/i) {
		quest::say("For those of you new to Norrath, I can improve your [valor]. For those who have lasted more than 30 seasons, Tricksy can protect you with an [aegolism]. For the rest of you, Eve can bestow upon you a greater [virtue]");
	}
	
	if ($text=~/valor/i) {
		$npc->CastSpell($userid,312);
	}
}

sub EVENT_TIMER {
	if ($timer == 17 && $qglobals{halloween} != 1) {
		quest::stoptimer(17);
                quest::settimer(1, 3600);
		} else {
                        quest::stoptimer(17);
			quest::settimer(17,5);
	}

	if ($timer == 1) { 
		quest::stoptimer(1);
		quest::settimer(2, 600); # 10min before wave 2

		quest::shout("Here they come!");

		quest::spawn2(20266,0,0,-151,976,7.5,215);
		quest::spawn2(20266,0,0,-161,976,7.5,215);
		quest::spawn2(20266,0,0,-131,976,7.5,215);
		quest::spawn2(20266,0,0,-121,976,7.5,215);

		quest::spawn2(20267,0,0,-151,986,7.5,215);
		quest::spawn2(20267,0,0,-161,986,7.5,215);
		quest::spawn2(20267,0,0,-131,986,7.5,215);
		quest::spawn2(20267,0,0,-121,986,7.5,215);

		quest::spawn2(20257,0,0,-141,976,7.5,215);
	}

	if ($timer == 2) {
		quest::stoptimer(2);
		quest::settimer(3, 600); # 10min before wave 3

		quest::spawn2(20269,0,0,-243,1500,-14,189.6);
		quest::spawn2(20269,0,0,-233,1500,-14,189.6);
		quest::spawn2(20269,0,0,-263,1500,-14,189.6);
		quest::spawn2(20269,0,0,-273,1500,-14,189.6);

		quest::spawn2(20268,0,0,-243,1510,-14,189.6);
		quest::spawn2(20268,0,0,-233,1510,-14,189.6);
		quest::spawn2(20268,0,0,-263,1510,-14,189.6);
		quest::spawn2(20268,0,0,-273,1510,-14,189.6);

		quest::spawn2(20256,0,0,-233,1500,-14,189.6);
	}

	if ($timer == 3) {
		quest::stoptimer(3);
		quest::settimer(4, 600); # 10min before wave 4

		quest::spawn2(20265,0,0,-151,976,7.5,215);
		quest::spawn2(20265,0,0,-161,976,7.5,215);
		quest::spawn2(20265,0,0,-131,976,7.5,215);
		quest::spawn2(20265,0,0,-121,976,7.5,215);

		quest::spawn2(20264,0,0,-151,986,7.5,215);
		quest::spawn2(20264,0,0,-161,986,7.5,215);
		quest::spawn2(20264,0,0,-131,986,7.5,215);
		quest::spawn2(20264,0,0,-121,986,7.5,215);
	
		quest::spawn2(20255,0,0,-141,976,7.5,215);
	}

	if ($timer == 4) {
		quest::stoptimer(4);
		quest::settimer(5, 600); # 10min before wave 5

		quest::spawn2(20272,0,0,-151,976,7.5,215);
		quest::spawn2(20272,0,0,-161,976,7.5,215);
		quest::spawn2(20272,0,0,-131,976,7.5,215);
		quest::spawn2(20272,0,0,-121,976,7.5,215);

		quest::spawn2(20273,0,0,-151,986,7.5,215);
		quest::spawn2(20273,0,0,-161,986,7.5,215);
		quest::spawn2(20273,0,0,-131,986,7.5,215);
		quest::spawn2(20273,0,0,-121,986,7.5,215);

		quest::spawn2(20261,0,0,-141,976,7.5,215);
	}

	if ($timer == 5) {
		quest::stoptimer(5);
		quest::settimer(6, 600); # 10min before wave 6

		quest::spawn2(20270,0,0,-243,1500,-14,189.6);
		quest::spawn2(20270,0,0,-233,1500,-14,189.6);
		quest::spawn2(20270,0,0,-263,1500,-14,189.6);
		quest::spawn2(20270,0,0,-273,1500,-14,189.6);

		quest::spawn2(20271,0,0,-243,1510,-14,189.6);
		quest::spawn2(20271,0,0,-233,1510,-14,189.6);
		quest::spawn2(20271,0,0,-263,1510,-14,189.6);
		quest::spawn2(20271,0,0,-273,1510,-14,189.6);

		quest::spawn2(20258,0,0,-233,1500,-14,189.6);
	}

	if ($timer == 6) {
		quest::stoptimer(6);

		quest::spawn2(20274,0,0,-243,1500,-14,189.6);
		quest::spawn2(20274,0,0,-233,1500,-14,189.6);
		quest::spawn2(20274,0,0,-263,1500,-14,189.6);
		quest::spawn2(20274,0,0,-273,1500,-14,189.6);

		quest::spawn2(20274,0,0,-243,1510,-14,189.6);
		quest::spawn2(20274,0,0,-233,1510,-14,189.6);
		quest::spawn2(20274,0,0,-263,1510,-14,189.6);
		quest::spawn2(20274,0,0,-273,1510,-14,189.6);

		quest::spawn2(20262,0,0,-233,1500,-14,189.6);
	}
}

sub EVENT_SIGNAL {
	quest::shout("We did it! Freeport is safe! Happy Halloween!");
}