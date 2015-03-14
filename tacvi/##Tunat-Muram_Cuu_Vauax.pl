#FormII

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::say("Now you feel my true wrath!");
quest::setnexthpevent(91);
#quest::settimer("Silence", 30);
#quest::settimer("Discord", 45);
#quest::settimer("Gaze", 60);
#quest::settimer("Haste", 1);
#quest::settimer("Dot", 15);
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("Silence"); 
quest::stoptimer("Discord");
quest::stoptimer("Gaze");
quest::stoptimer("Haste");
quest::stoptimer("Dot");
$npc->WipeHateList();
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}

if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("Silence"); 
quest::stoptimer("Discord");
quest::stoptimer("Gaze");
quest::stoptimer("Haste");
quest::stoptimer("Dot");
$npc->WipeHateList();
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}


}

sub EVENT_HP  { 

if ($hpevent == 91) {
quest::setnexthpevent(31);
quest::spawn2(298210,0,0, $x, $y, $z, $h);
quest::depop();
}
}



sub EVENT_TIMER {

	if ($timer eq "Silence") {
		my $TimeA = quest::ChooseRandom(45,50,55,60,65,70,75,80,85,90,95,100,105,115,120);
		quest::stoptimer("Silence");
		quest::settimer("Silence", $TimeA);
		plugin::CastOnTarget(5555);
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



}



