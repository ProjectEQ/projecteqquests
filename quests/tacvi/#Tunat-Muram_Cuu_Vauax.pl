##5555 Bellow of Tunat Silence
##4739 Discord rebook 3k AE
##5546 Gaze of Tunat spell slow uncureable (Phylactry)
##4740 Tuna'ts Self haste 50%.
##5545 Tunat Touch Dot
##Wave of Rage get ID from 4728

sub EVENT_SPAWN {
	quest::depopall(297012);
	quest::settimer("Pop", 5);
}

sub EVENT_COMBAT {

 	if ($combat_state == 1) {
		quest::say("You will beg for mercy by the end.");
		quest::setnexthpevent(99);
	}

	if ($combat_state == 0) {
		$npc->SetHP($npc->GetMaxHP() * 1);
		quest::emote("calms down");
		quest::stoptimer("Discord");
		quest::stoptimer("Gaze");
		quest::stoptimer("Haste");
		quest::stoptimer("Dot");
		$npc->WipeHateList();
		quest::depopall(297012);
		#quest::spawn2(297014,0,0, 463.8, -170.8, 26.6, 54.9);
		quest::settimer("RePop", 5);
		#quest::depop();
	}
}

sub EVENT_HP  { 

	if ($hpevent == 99) {
		quest::setnexthpevent(31);
		quest::settimer("Silence", 30);
		quest::settimer("Discord", 45);
		quest::settimer("Gaze", 60);
		quest::settimer("Haste", 1);
		quest::settimer("Dot", 15);
		quest::settimer("Heal",100); 
	}


	if ($hpevent == 31) {
		quest::setnexthpevent(0);
		quest::signalwith(297012,1,0);
		quest::say("Feast on their flesh my pets!");
	}

}



sub EVENT_TIMER {


	if ($timer eq "Pop") {
		quest::stoptimer("Pop");
		quest::spawn2(297012,0,0, 476, -145, 30, 620);
		quest::spawn2(297012,0,0, 475, -196, 30, 528);
	}

	if ($timer eq "RePop") {
		quest::stoptimer("RePop");
		quest::spawn2(297014,0,0, 463.8, -170.8, 26.6, 54.9);
		quest::depop();
	}

	if ($timer eq "Silence") {
		my $TimeA = quest::ChooseRandom(45,50,55,60,65,70,75,80,85,90,95,100,105,115,120);
		quest::stoptimer("Silence");
		quest::settimer("Silence", $TimeA);
		#plugin::CastOnTarget(5555);
	}

	if ($timer eq "Discord") {
		my $TimeB = quest::ChooseRandom(45,50,55,60,65,70,75,80,85,90,95,100,105,115,120);
		quest::stoptimer("Discord");
		quest::settimer("Discord", $TimeB);
		plugin::CastOnTarget(4379);
	}
	
	if ($timer eq "Gaze") {
		my $TimeC = quest::ChooseRandom(75,80,85,90,95,100,105,115,120);
		quest::stoptimer("Gaze");
		quest::settimer("Gaze", $TimeC);
		plugin::CastOnTarget(5546);
	}
	
	if ($timer eq "Dot") {
		my $TimeD = quest::ChooseRandom(70,75,80,85,90,95,100,105,115,120);
		quest::stoptimer("Dot");
		quest::settimer("Dot", $TimeD);
		plugin::CastOnTarget(5545);
		
	}
	
	if ($timer eq "Haste") {
		my $TimeE = quest::ChooseRandom(200);
		quest::stoptimer("Haste");
		quest::settimer("Haste", $TimeE);
		$npc->CastSpell(4740, $mobid);
		
	}

	if ($timer eq "Heal") {
		my $TimeF = quest::ChooseRandom(120,125,130,140,150,160,170);
		quest::emote("Tunat`Muram Cuu Vauax pauses for a moment as a portion of his spirit is transferred into one of the phylacteries."); 
		quest::signalwith(297013,1,0);
		quest::stoptimer("Heal");
		quest::settimer("Heal", $TimeF);
		quest::signalwith(297013,1,0);
		#Unused#$npc->CastSpell(7045, $mobid);
	}

}

sub EVENT_DEATH {
	$entity_list->MessageClose($npc, 1, 500, 15,"In an explosion of energy, Tunat'Muram Cuu Vauax disappears while ancient pebbles pelt against your armor.");
	$entity_list->MessageClose($npc, 1, 500, 7, "The room is filled with an eerie laugh");
	quest::say ("You have done well to defeat my doppelganger and have shown great strength by making it this far, but I'm afraid I must end your struggle here. Your days have been numbered since you first set foot upon this continent and your time is up. Kneel before me and I will grant you a quick death, but resist and you will suffer in ways that will be spoken about in hushed tones for eons to come");
	$timestamp = localtime(time);
	quest::write("text_files/Tacvi.txt","[$timestamp]:$mname FIRST was killed by $name the $class.");
	quest::spawn2(297055,0,0, 309, -170.8, 21.3, 59.4);
	quest::setglobal("TunatOne_Dead", 1, 7, "H1");
}



