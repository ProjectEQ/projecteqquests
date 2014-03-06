#90%: Pixtt Xxeric Kex (flurries; spawns four ukun adds immediately) CHECK
#80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns four ikaav hatchling adds if you take too long) 
#70%: Pixtt Riel Tavas (unstable construct adds if you take too long) 
#60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee) 
#50%: Zun`Muram Yihst Vor (single-target rampage; straight melee) 
#40%: Zun`Muram Mordl Delt (single-target rampage; flurries; two "Zun`Muram Mordl Delt" adds) 
#30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee - may AE rampage rarely..) 
#20%: Tunat`Muram Cuu Vauax (single-target rampage; AEs "Wave of Rage") 

sub EVENT_SPAWN {
$npc->SetHP($npc->GetMaxHP() * .9);
quest::setnexthpevent(81);
quest::spawn2(298141,0,0, 349.297302246094, -213.105529785156, 21.4144954681396 , 225.125);
quest::spawn2(298142,0,0, 360.507293701172, -159.274215698242, 21.4144954681396 , 190); 
quest::spawn2(298143,0,0, 331.863159179688, -110.501838684082, 21.4144954681396 , 140.375); 
quest::spawn2(298144,0,0, 303.64501953125, -236.793533325195, 21.4144973754883 , 252.5);
}

sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::settimer("Hoof",15);
}

if (($combat_state == 0) &&  (!defined($qglobals{TunatOne_Dead})) ) {
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298141);
quest::depopall(298142); 
quest::depopall(298143);
quest::depopall(298144);
quest::depopall(298112);
quest::spawn2(298114,0,0, 463.8, -170.8, 26.6, 54.9);
quest::depop();
}


if (($combat_state == 0) &&  (defined($qglobals{TunatOne_Dead})) ){
$npc->SetHP($npc->GetMaxHP() * 1);
quest::emote("calms down");
$npc->WipeHateList();
quest::depopall(298141);
quest::depopall(298142); 
quest::depopall(298143);
quest::depopall(298144);
quest::depopall(298112);
quest::spawn2(298155,0,0, 309, -170.8, 21.3, 59.4);
quest::depop();
}



}

sub EVENT_HP  { 

if ($hpevent == 81) {
quest::spawn2(298211,0,0, $x, $y, $z, $h);
quest::signalwith(298141,1,0);
quest::signalwith(298142,1,0);
quest::signalwith(298143,1,0); 
quest::signalwith(298144,1,0);
quest::depopall(298141);
quest::depopall(298142); 
quest::depopall(298143);
quest::depopall(298144);
quest::depop();
}
}



sub EVENT_TIMER {

	if ($timer eq "Hoof") {
		my $TimeA = quest::ChooseRandom(18,19,20,21,22,23,24,25,26,27,28);
		quest::stoptimer("Hoof");
		quest::settimer("Hoof", $TimeA);
		my $b = $npc->GetTarget();
		if ($b)
		{
			my $a = 0; if ($b) { $a = $b->GetID(); }
			plugin::CastOnTarget(4577);
			#Hoof Stomp
		}
	}

}



