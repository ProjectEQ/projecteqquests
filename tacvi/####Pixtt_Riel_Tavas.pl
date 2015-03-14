#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) 
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) CHECK
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .7);
quest::setnexthpevent(61);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::settimer("Wrath",15);
quest::settimer("Adds",60);
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298218);
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}

if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298218);
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}


}

sub EVENT_HP  { 

if ($hpevent == 61) {
quest::spawn2(298213,0,0, $x, $y, $z, $h);
quest::depopall(298218);
quest::depop();
}
}



sub EVENT_TIMER {

	if ($timer eq "Wrath") {
		my $TimeA = quest::ChooseRandom(45,50,55,60,65,70,75,80,85,90,95,100,105,110,120,125,130,135,145,150,155,160,170);
		quest::stoptimer("Wrath");
		quest::settimer("Wrath", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(888);
			#FD
		}
	}

if ($timer eq "Adds") {
quest::stoptimer("Adds");
quest::settimer("Adds",60);
quest::spawn2(298218,0,0, 349.297302246094, -213.105529785156, 21.4144954681396 , 225.125);
quest::spawn2(298218,0,0, 360.507293701172, -159.274215698242, 21.4144954681396 , 190); 
quest::spawn2(298218,0,0, 331.863159179688, -110.501838684082, 21.4144954681396 , 140.375); 
quest::spawn2(298218,0,0, 303.64501953125, -236.793533325195, 21.4144973754883 , 252.5);
quest::settimer("Venom", 10);
  }

	if ($timer eq "Venom") {
		my $TimeB = quest::ChooseRandom(45,50,55,60);
		quest::stoptimer("Venom");
		quest::settimer("Venom", $TimeB);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(751);
			#Venom
		}
	}

}



