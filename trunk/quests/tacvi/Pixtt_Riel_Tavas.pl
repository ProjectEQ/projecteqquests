#First Tacvi Boss
#888 Wrath of Ikkaz
#751 Ikkav Venom
#4661 Cataclysm of stone

sub EVENT_SPAWN {
quest::spawn2(297002,0,0, 206, -574, -6.6, 192.5);
quest::spawn2(297002,0,0, 206, -601, -6.6, 192.5);
quest::delglobal("PRT_Door");
quest::setglobal("PRT_DoorExit", 1, 7, "F");
quest::stoptimer("Wrath");
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::say("Tavas says 'You shall regret trespassing into my chambers. Rise my minions and show them how well I have learned to use the power of this land's creatures. Destroy them all. Leave only enough to feed the hounds");
quest::setnexthpevent(98);
quest::settimer("Wrath", 15);
}

if ($combat_state == 0) {
quest::delglobal("PRT_Door");
#quest::spawn2(297002,0,0, 206, -574, -6.6, 192.5);
#quest::spawn2(297002,0,0, 206, -601, -6.6, 192.5);
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
quest::stoptimer("ConstructSpawnA"); 
quest::stoptimer("ConstructSpawnB"); 
quest::stoptimer("ConstructSpawnC"); 
quest::stoptimer("ConstructSpawnD"); 
quest::stoptimer("ConstructSpawnE"); 
quest::stoptimer("ConstructSpawnF"); 
quest::stoptimer("ConstructSpawnG"); 
quest::stoptimer("ConstructSpawnH"); 
quest::stoptimer("Wrath");
$npc->WipeHateList();
quest::depopall(297002);
quest::depopall(297045);
#quest::spawn2(297032,0,0, 198.2, -588.3, -6.9, 192);
#quest::depop();
quest::settimer("RepopAdds", 5);
$npc->NPCSpecialAttacks("SERQMCNIDf", 0);
}
}

sub EVENT_HP  { 

if ($hpevent == 98) {
quest::setnexthpevent(76);
quest::setglobal("PRT_Door", 1, 7, "F");
}

if ($hpevent == 76) {
quest::setnexthpevent(31);
#Add Flurry
$npc->NPCSpecialAttacks("SERQMCNIDfF", 0);
quest::say("So it seems you are not so easily defeated after all. I am through toying with you fools. Prepare for the reality of death.");
quest::emote("body begins to speed up as her attacks become increasingly vicious");
}

if ($hpevent == 31) {
quest::setnexthpevent(11);
quest::settimer("Venom", 1);
quest::settimer("ConstructSpawnA", 1);
quest::settimer("ConstructSpawnB", 3);
quest::settimer("ConstructSpawnC", 7);
quest::settimer("ConstructSpawnD", 9);
quest::settimer("ConstructSpawnE", 11);
quest::settimer("ConstructSpawnF", 13);
quest::settimer("ConstructSpawnG", 60);
quest::settimer("ConstructSpawnH", 65);
}

if ($hpevent == 11) {
quest::setnexthpevent(0);
quest::say("That's it! You have past the point of being bothersome. I grow weary of this encounter. It is time for it to end");
}

}



sub EVENT_TIMER {

if ($timer eq "RepopAdds") {
quest::stoptimer("RepopAdds");
quest::spawn2(297002,0,0, 206, -574, -6.6, 192.5);
quest::spawn2(297002,0,0, 206, -601, -6.6, 192.5);
quest::emote("gazes inward");
  }

if ($timer eq "ConstructSpawnA") {
my $TimeCA = quest::ChooseRandom(30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45);
quest::stoptimer("ConstructSpawnA");
quest::settimer("ConstructSpawnA", $TimeCA);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnB") {
my $TimeCB = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnB");
quest::settimer("ConstructSpawnB", $TimeCB);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnC") {
my $TimeCC = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnC");
quest::settimer("ConstructSpawnC", $TimeCC);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnD") {
my $TimeCD = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnD");
quest::settimer("ConstructSpawnD", $TimeCD);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnE") {
my $TimeCE = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnE");
quest::settimer("ConstructSpawnE", $TimeCE);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnF") {
my $TimeCF = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnF");
quest::settimer("ConstructSpawnF", $TimeCF);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnG") {
my $TimeCG = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnG");
quest::settimer("ConstructSpawnG", $TimeCG);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }
if ($timer eq "ConstructSpawnH") {
my $TimeCH = quest::ChooseRandom(35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50);
quest::stoptimer("ConstructSpawnH");
quest::settimer("ConstructSpawnH", $TimeCH);
quest::spawn2(297045,0,0, 54, -588, -6.7, $h);
  }


	if ($timer eq "Wrath")
	{
		my $TimeA = quest::ChooseRandom(35,40,45);
		quest::stoptimer("Wrath");
		quest::settimer("Wrath", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(888);
		}
		#FD 
	}

	if ($timer eq "Venom")
	{
		my $TimeB = quest::ChooseRandom(45,50,55,60);
		quest::stoptimer("Venom");
		quest::settimer("Venom", $TimeB);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(751);
		}
		#Venom
	}
	
}
  

sub EVENT_DEATH {
quest::delglobal("PRT_Door");
quest::delglobal("PRT_DoorExit");
#quest::say ("text");
#quest::emote ("text");
$timestamp = localtime(time);
quest::write("text_files/Tacvi.txt","[$timestamp]:$mname was killed by $name the $class.");

}



